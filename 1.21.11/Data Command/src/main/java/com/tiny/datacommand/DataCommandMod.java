package com.tiny.datacommand;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.resource.ResourceManagerHelper;
import net.minecraft.resource.ResourceType;

public class DataCommandMod implements ModInitializer {
    @Override
    public void onInitialize() {
        DynamicCommandManager commandLoader = new DynamicCommandManager();
        
        // Register the Datapack Reload Listener
        ResourceManagerHelper.get(ResourceType.SERVER_DATA).registerReloadListener(commandLoader);

        // Intercept vanilla command tree builds
        CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> {
            DynamicCommandManager.setDispatcher(dispatcher);
            DynamicCommandManager.registerAllDynamicCommands(dispatcher);
        });
    }
}
