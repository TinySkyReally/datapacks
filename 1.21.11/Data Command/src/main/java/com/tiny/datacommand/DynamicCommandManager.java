package com.tiny.datacommand;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.BoolArgumentType;
import com.mojang.brigadier.arguments.IntegerArgumentType;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.builder.ArgumentBuilder;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.SimpleCommandExceptionType;
import net.fabricmc.fabric.api.resource.SimpleSynchronousResourceReloadListener;
import net.minecraft.resource.Resource;
import net.minecraft.resource.ResourceManager;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import net.minecraft.util.Identifier;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.util.math.Vec3d;
import net.minecraft.util.math.Vec2f;
import net.minecraft.server.world.ServerWorld;
import net.minecraft.command.permission.PermissionPredicate;

import java.io.BufferedReader;
import java.util.*;

public class DynamicCommandManager implements SimpleSynchronousResourceReloadListener {
    private static final Gson GSON = new Gson();
    private static final Map<String, CustomCommandConfig> REGISTERED_CONFIGS = new HashMap<>();
    private static CommandDispatcher<ServerCommandSource> activeDispatcher;
    private static MinecraftServer serverInstance; 

    @Override
    public Identifier getFabricId() {
        return Identifier.of("macrocmd", "commands");
    }

    public static void setDispatcher(CommandDispatcher<ServerCommandSource> dispatcher) {
        activeDispatcher = dispatcher;
    }

    public static void setServerInstance(MinecraftServer server) {
        serverInstance = server;
    }

    @Override
    public void reload(ResourceManager manager) {
        REGISTERED_CONFIGS.clear();
        
        Map<Identifier, Resource> resources = manager.findResources("command", id -> id.getPath().endsWith(".json"));
        
        for (Map.Entry<Identifier, Resource> entry : resources.entrySet()) {
            Identifier id = entry.getKey();
            Resource resource = entry.getValue();
            
            try (BufferedReader reader = resource.getReader()) {
                CustomCommandConfig config = GSON.fromJson(reader, CustomCommandConfig.class);
                String path = id.getPath();
                String commandName = path.substring(path.lastIndexOf('/') + 1, path.lastIndexOf('.'));
                
                REGISTERED_CONFIGS.put(commandName, config);
            } catch (Exception e) {
                System.err.println("Failed to parse custom command json: " + id + " - " + e.getMessage());
            }
        }

        if (activeDispatcher != null) {
            registerAllDynamicCommands(activeDispatcher);
        }

        if (serverInstance != null) {
            serverInstance.execute(() -> {
                serverInstance.getPlayerManager().getPlayerList().forEach(player -> {
                    serverInstance.getCommandManager().sendCommandTree(player);
                });
            });
        }
    }

    public static void registerAllDynamicCommands(CommandDispatcher<ServerCommandSource> dispatcher) {
        for (Map.Entry<String, CustomCommandConfig> entry : REGISTERED_CONFIGS.entrySet()) {
            String cmdName = entry.getKey();
            CustomCommandConfig config = entry.getValue();

            LiteralArgumentBuilder<ServerCommandSource> commandNode = CommandManager.literal(cmdName);

            if (config.permission_level > 0) {
                commandNode.requires(
                    CommandManager.requirePermissionLevel(
                        switch (config.permission_level) {
                            case 1 -> CommandManager.MODERATORS_CHECK;
                            case 2 -> CommandManager.GAMEMASTERS_CHECK;
                            case 3 -> CommandManager.ADMINS_CHECK;
                            case 4 -> CommandManager.OWNERS_CHECK;
                            default -> CommandManager.MODERATORS_CHECK;
                        }
                    )
                );
            }

            // Fallback node if they type absolutely no arguments
            commandNode.executes(context -> executeMacroCommand(context, config));

            // Start parsing the optional / required argument chains
            buildArgumentTree(commandNode, config.args, 0, config);
            dispatcher.register(commandNode);
        }
    }

    private static void buildArgumentTree(
            ArgumentBuilder<ServerCommandSource, ?> parentNode,
            List<CustomCommandConfig.ArgConfig> args,
            int index,
            CustomCommandConfig config) {

        if (args == null || index >= args.size()) return;

        CustomCommandConfig.ArgConfig currentArg = args.get(index);
        
        ArgumentBuilder<ServerCommandSource, ?> argNode = CommandManager.argument(
                currentArg.name, 
                getArgumentType(currentArg.type)
        );

        // Every step can potentially be an execution endpoint
        argNode.executes(context -> executeMacroCommand(context, config));

        // Advance downstream
        buildArgumentTree(argNode, args, index + 1, config);
        parentNode.then(argNode);
    }

    private static com.mojang.brigadier.arguments.ArgumentType<?> getArgumentType(String type) {
        if (type == null) return StringArgumentType.string();
        return switch (type.toLowerCase()) {
            case "integer", "int" -> IntegerArgumentType.integer();
            case "boolean", "bool" -> BoolArgumentType.bool();
            default -> StringArgumentType.string();
        };
    }

    private static String safeGet(CommandContext<ServerCommandSource> ctx, String name, String type) {
        try {
            return switch (type == null ? "string" : type.toLowerCase()) {
                case "int", "integer" -> String.valueOf(IntegerArgumentType.getInteger(ctx, name));
                case "bool", "boolean" -> String.valueOf(BoolArgumentType.getBool(ctx, name));
                default -> StringArgumentType.getString(ctx, name);
            };
        } catch (Exception e) {
            return null; // Gracefully handles if user didn't type it
        }
    }

    private static int executeMacroCommand(CommandContext<ServerCommandSource> context, CustomCommandConfig config) throws CommandSyntaxException {
        ServerCommandSource source = context.getSource();
        JsonObject json = new JsonObject();

        if (config.args != null) {
            for (CustomCommandConfig.ArgConfig arg : config.args) {
                // Dynamically fetch values right out of Brigadier context directly!
                String value = safeGet(context, arg.name, arg.type);

                if (value == null || value.trim().isEmpty()) {
                    if (arg.required) {
                        throw new SimpleCommandExceptionType(Text.literal("Missing required argument: " + arg.name)).create();
                    }
                    value = arg.defaultValue; // Corrected field matching your JSON ('default')
                }

                if (value != null) {
                    String type = arg.type == null ? "string" : arg.type.toLowerCase();
                    try {
                        switch (type) {
                            case "int", "integer" -> json.addProperty(arg.name, Integer.parseInt(value));
                            case "bool", "boolean" -> json.addProperty(arg.name, Boolean.parseBoolean(value));
                            default -> json.addProperty(arg.name, value);
                        }
                    } catch (Exception e) {
                        json.addProperty(arg.name, value);
                    }
                }
            }
        }

        try {
            String commandToRun;
            if (json.size() > 0) {
                commandToRun = "function " + config.function + " " + GSON.toJson(json);
            } else {
                commandToRun = "function " + config.function;
            }

            ServerPlayerEntity player = source.getPlayer();

            ServerCommandSource elevatedSource = source
                    .withEntity(player)
                    .withPermissions(PermissionPredicate.ALL);

            var parseResults = source.getServer()
                    .getCommandManager()
                    .getDispatcher()
                    .parse(commandToRun, elevatedSource);

            source.getServer()
                    .getCommandManager()
                    .execute(parseResults, commandToRun);

            return 1;
            
        } catch (Exception e) {
            throw new SimpleCommandExceptionType(Text.literal("Command execution failed: " + e.getMessage())).create();
        }
    }
}
