import getpass
import json
import os
import shutil
import subprocess
import zipfile

import paramiko
import requests

# ==========================================
# CONFIGURATION - PATHS & HARDCODED TARGETS
# ==========================================
HOME = os.path.expanduser("~")

DATAPACK_SRC_DIR = f"{HOME}/Documents/datapacks"
BUILDS_DIR = f"{HOME}/Documents/datapacks/builds"
MINECRAFT_WORLD_DIR = f"{HOME}/Library/Application Support/ModrinthApp/profiles/MatyTiPack 1.0.0/saves/datapack testing wowec/datapacks"

# Modrinth Settings
MODRINTH_PROJECT_ID = "i8SI1aUG"
MODRINTH_TOKEN = os.environ.get("MODRINTH_TOKEN")
LOADERS = ["datapack"]

# PebbleHost SFTP Configuration
SFTP_HOST = "uk19.pebblehost.net"
SFTP_PORT = 2222
SFTP_USER = os.environ.get("SFTP_USER")
SFTP_REMOTE_DIR = "/home/container/world/datapacks"


# ==========================================
# CENTRALIZED CONTEXT PARSER
# ==========================================
def load_datapack_context():
    """Prompts for target configurations, reads settings.json, and handles fallback logic."""
    print("\n--- Target Datapack Context Initialization ---")
    datapack_name = input("Enter datapack folder name (e.g., Tiny Auth): ").strip()
    mc_version = input("Enter target Minecraft version (e.g., 1.21.6+): ").strip()

    if not datapack_name or not mc_version:
        print("❌ Error: Datapack name and Minecraft version are both required.")
        return None

    # Resolve target dynamic directory: /Base/MinecraftVersion/DatapackName
    target_dir = os.path.join(DATAPACK_SRC_DIR, mc_version, datapack_name)
    settings_path = os.path.join(target_dir, "settings.json")

    if not os.path.exists(settings_path):
        print(f"❌ Error: settings.json missing at target path: {settings_path}")
        return None

    try:
        with open(settings_path, "r", encoding="utf-8") as f:
            settings = json.load(f)
    except Exception as e:
        print(f"❌ Error: Failed parsing settings.json: {e}")
        return None

    # 1. Evaluate Datapack Version (Hard Stop if missing)
    dp_version = settings.get("datapack_version") or settings.get("version")
    if not dp_version:
        print(
            "❌ Build Blocked: 'datapack_version' key is completely missing from settings.json!"
        )
        return None

    # 2. Evaluate Description Fallback
    description = settings.get("description", "").strip()

    # 3. Evaluate Modrinth UI Name Fallback
    display_name = settings.get("name", f"{datapack_name} {dp_version}").strip()

    # 4. Evaluate Game Support targets
    game_versions = settings.get("game_versions", [mc_version])

    # Dynamic target zip name convention assembly: Datapack Name_1.2.7MC1.21.6+.zip
    zip_name = f"{datapack_name}_{dp_version}MC{mc_version}.zip"
    zip_path = os.path.join(BUILDS_DIR, zip_name)

    return {
        "datapack_name": datapack_name,
        "mc_version": mc_version,
        "src_dir": target_dir,
        "datapack_version": dp_version,
        "description": description,
        "display_name": display_name,
        "game_versions": game_versions,
        "zip_name": zip_name,
        "zip_path": zip_path,
    }


def show_menu():
    print("\n--- TINYAUTH BUILD & DEPLOY PIPELINE ---")
    print("1. Git Commit & Push to GitHub")
    print("2. Compile Datapack to ZIP")
    print("3. Upload Build to Modrinth")
    print("4. Deploy Datapack (Local Singleplayer or Remote PebbleHost)")
    print("5. Exit")
    return input("Select an option (1-5): ")


# 1. GITHUB AUTOMATION
def github_push():
    print("\n--- GitHub Push [Entire Workspace] ---")
    commit_msg = input("Enter your commit message: ")
    if not commit_msg.strip():
        print("Commit message cannot be empty!")
        return

    try:
        # Executes directly inside the main root datapacks directory
        subprocess.run(["git", "add", "."], check=True, cwd=DATAPACK_SRC_DIR)
        subprocess.run(
            ["git", "commit", "-m", commit_msg], check=True, cwd=DATAPACK_SRC_DIR
        )
        subprocess.run(["git", "push"], check=True, cwd=DATAPACK_SRC_DIR)
        print("🎉 Successfully pushed entire workspace to GitHub!")
    except subprocess.SubprocessError as e:
        print(f"❌ Git operation failed: {e}")


# 2. ZIP COMPILATION
def compile_zip(ctx):
    print(f"\n--- Compiling Output: {ctx['zip_name']} ---")
    os.makedirs(BUILDS_DIR, exist_ok=True)

    with zipfile.ZipFile(ctx["zip_path"], "w", zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(ctx["src_dir"]):
            for file in files:
                # Filter out build artifacts, configuration sheets, and version git heads
                if ".git" in root or "builds" in root or file == "settings.json":
                    continue
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, ctx["src_dir"])
                zipf.write(file_path, arcname)

    print(f"🥇 ZIP created successfully at: {ctx['zip_path']}")


# 3. MODRINTH AUTOMATION
def upload_to_modrinth(ctx):
    print("\n--- Uploading Release to Modrinth ---")
    if not os.path.exists(ctx["zip_path"]):
        print("📦 Target archive not found. Compiling workspace first...")
        compile_zip(ctx)

    metadata = {
        "project_id": MODRINTH_PROJECT_ID,
        "version_number": ctx["datapack_version"],
        "changelog": ctx["description"]
        if ctx["description"]
        else f"Release build {ctx['datapack_version']}",
        "game_versions": ctx["game_versions"],
        "loaders": LOADERS,
        "version_type": "release",
        "name": ctx["display_name"],
        "file_parts": ["file_contents"],
    }

    headers = {
        "Authorization": MODRINTH_TOKEN,
        "User-Agent": "MatyMac/tinyauth-datapack-pipeline/1.0",
    }

    try:
        with open(ctx["zip_path"], "rb") as build_file:
            payload_files = {
                "data": (None, json.dumps(metadata), "application/json"),
                "file_contents": (ctx["zip_name"], build_file, "application/zip"),
            }
            response = requests.post(
                "https://api.modrinth.com/v2/version",
                headers=headers,
                files=payload_files,
            )

        if response.status_code in [200, 201]:
            print("🚀 Successfully uploaded target artifact to Modrinth!")
        else:
            print(f"❌ Modrinth Error ({response.status_code}): {response.text}")
    except Exception as e:
        print(f"❌ Modrinth upload network crash: {e}")


# 4. ENVIRONMENTS DEPLOYMENT (LOCAL VS REMOTE SFTP)
def deploy_pipeline(ctx):
    print("\n--- Deployment Routing Option ---")
    print("1. Copy Unzipped Source to Local Singleplayer World")
    print("2. Stream Output ZIP to Remote Server via SFTP (PebbleHost)")
    choice = input("Select route destination (1-2): ").strip()

    if choice == "1":
        if not os.path.exists(MINECRAFT_WORLD_DIR):
            print(
                f"❌ Pathing Error: Target world folder path doesn't exist: {MINECRAFT_WORLD_DIR}"
            )
            return
        try:
            target_path = os.path.join(MINECRAFT_WORLD_DIR, ctx["datapack_name"])
            if os.path.exists(target_path):
                shutil.rmtree(target_path)
            shutil.copytree(
                ctx["src_dir"],
                target_path,
                ignore=shutil.ignore_patterns(".git", "builds", "settings.json"),
            )
            print(
                "✅ Successfully deployed raw workspace folder. Execute /reload in-game."
            )
        except Exception as e:
            print(f"❌ Local transfer failure: {e}")

    elif choice == "2":
        if not os.path.exists(ctx["zip_path"]):
            print("📦 Target archive not found. Pre-compiling source now...")
            compile_zip(ctx)

        # Dynamic password prompt masking
        server_pass = getpass.getpass(f"Enter SFTP Password for user [{SFTP_USER}]: ")

        try:
            print(f"Opening secure tunnel to PebbleHost ({SFTP_HOST}:{SFTP_PORT})...")
            transport = paramiko.Transport((SFTP_HOST, SFTP_PORT))
            transport.connect(username=SFTP_USER, password=server_pass)

            sftp = paramiko.SFTPClient.from_transport(transport)
            remote_destination = f"{SFTP_REMOTE_DIR}/{ctx['zip_name']}"

            print(f"Uploading file stream to server space: {remote_destination}...")
            sftp.put(ctx["zip_path"], remote_destination)

            sftp.close()
            transport.close()
            print(
                "🚀 Secure SFTP upload completed successfully! Your ZIP is on PebbleHost."
            )
        except Exception as e:
            print(f"❌ SFTP stream pipeline crashed: {e}")
    else:
        print("Invalid environment choice.")


# MAIN CONTROLLER LOOP
def main():
    while True:
        choice = show_menu()

        # Choice 1 runs cleanly without checking target datapack contexts
        if choice == "1":
            github_push()

        elif choice in ["2", "3", "4"]:
            ctx = load_datapack_context()
            if not ctx:
                continue  # context setup failed, drop back to menu

            if choice == "2":
                compile_zip(ctx)
            elif choice == "3":
                upload_to_modrinth(ctx)
            elif choice == "4":
                deploy_pipeline(ctx)

        elif choice == "5":
            print("Exiting Pipeline. Goodbye!")
            break
        else:
            print("Invalid option selection, please cycle through 1-5.")


if __name__ == "__main__":
    main()
