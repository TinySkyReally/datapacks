dialog clear @s

execute unless data storage tiny_auth:temp auth.dimension run data modify storage tiny_auth:temp auth.dimension set from storage tiny_auth:config default_dimension
execute unless data storage tiny_auth:temp auth.dimension run data modify storage tiny_auth:temp auth.dimension set value "minecraft:overworld"
execute unless data storage tiny_auth:temp auth.x run data modify storage tiny_auth:temp auth.x set from storage tiny_auth:config default_x
execute unless data storage tiny_auth:temp auth.x run data modify storage tiny_auth:temp auth.x set value 0
execute unless data storage tiny_auth:temp auth.y run data modify storage tiny_auth:temp auth.y set from storage tiny_auth:config default_y
execute unless data storage tiny_auth:temp auth.y run data modify storage tiny_auth:temp auth.y set value 0
execute unless data storage tiny_auth:temp auth.z run data modify storage tiny_auth:temp auth.z set from storage tiny_auth:config default_z
execute unless data storage tiny_auth:temp auth.z run data modify storage tiny_auth:temp auth.z set value 0
execute unless data storage tiny_auth:temp auth.yaw run data modify storage tiny_auth:temp auth.yaw set from storage tiny_auth:config default_yaw
execute unless data storage tiny_auth:temp auth.yaw run data modify storage tiny_auth:temp auth.yaw set value 0
execute unless data storage tiny_auth:temp auth.pitch run data modify storage tiny_auth:temp auth.pitch set from storage tiny_auth:config default_pitch
execute unless data storage tiny_auth:temp auth.pitch run data modify storage tiny_auth:temp auth.pitch set value 0
execute unless data storage tiny_auth:temp auth.gamemode run data modify storage tiny_auth:temp auth.gamemode set from storage tiny_auth:config default_gamemode
execute unless data storage tiny_auth:temp auth.gamemode run data modify storage tiny_auth:temp auth.gamemode set value "survival"
execute unless data storage tiny_auth:temp auth.UUID run data modify storage tiny_auth:temp auth.UUID set from entity @s UUID

function tiny_auth:auth/success/macro with storage tiny_auth:temp auth

scoreboard players set @s tinyauth.auth.state 0
scoreboard players enable @s tinyauth.auth.change_password
scoreboard players enable @s tinyauth.auth.logout
scoreboard players enable @s tinyauth.auth.create_personal_theme
scoreboard players enable @s tinyauth.auth.control_panel

playsound minecraft:entity.player.levelup ui @s ~ ~ ~ 100 2
