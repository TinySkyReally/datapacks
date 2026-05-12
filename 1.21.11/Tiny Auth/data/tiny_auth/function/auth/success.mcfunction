dialog clear @s

$execute in $(dimension) run tp $(x) $(y) $(z)
$gamemode $(gamemode)
scoreboard players set @s tinyauth.auth.state 0
scoreboard players enable @s tinyauth.auth.change_password
scoreboard players enable @s tinyauth.auth.logout
scoreboard players enable @s tinyauth.auth.create_personal_theme

attribute @s minecraft:block_break_speed base reset
attribute @s minecraft:attack_damage base reset
attribute @s minecraft:movement_speed base reset
attribute @s minecraft:jump_strength base reset
attribute @s minecraft:block_interaction_range base reset
attribute @s minecraft:entity_interaction_range base reset

$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:block_break_speed"}]
$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:attack_damage"}]
$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:movement_speed"}]
$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:jump_strength"}]
$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:block_interaction_range"}]
$function tiny_auth:auth/attributes/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].attributes[{id:"minecraft:entity_interaction_range"}]

effect clear @s minecraft:blindness
effect clear @s minecraft:resistance
effect clear @s minecraft:invisibility

$function tiny_auth:auth/effects/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].active_effects[{id:"minecraft:blindness"}]
$function tiny_auth:auth/effects/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].active_effects[{id:"minecraft:resistance"}]
$function tiny_auth:auth/effects/return with storage tiny_auth:keys auths[{UUID:$(UUID)}].active_effects[{id:"minecraft:invisibility"}]

playsound minecraft:entity.player.levelup ui @s ~ ~ ~ 100 2
