$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:keys auths append value {UUID:$(UUID),password:"",input:""}
$execute if data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:temp plrData set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

$execute if data storage tiny_auth:temp {plrData:{UUID:$(UUID)}} in tiny_auth:authdim run item replace block 1000 0 0 container.0 with minecraft:air
$execute if data storage tiny_auth:temp {plrData:{UUID:$(UUID)}} in tiny_auth:authdim run loot replace block 1000 0 0 container.0 loot {type:"minecraft:chest",pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:player_head",functions:[{function:"minecraft:fill_player_head",entity:"this"}]}]}],functions:[]}
$execute if data storage tiny_auth:temp {plrData:{UUID:$(UUID)}} in tiny_auth:authdim run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].Name set from block 1000 0 0 Items[{Slot:0b}].components."minecraft:profile".name

scoreboard players set @s tinyauth.detection.leave_game 0
scoreboard players set @s tinyauth.auth.gui_opened 0

function tiny_auth:auth/reset_input with entity @s

#Session Check
execute store result score #current_tick tinyauth.auth.temp run time query gametime

scoreboard players operation @s tinyauth.session_delta = #current_tick tinyauth.auth.temp
scoreboard players operation @s tinyauth.session_delta -= @s tinyauth.last_seen

execute if score @s tinyauth.session_delta matches ..600 run function tiny_auth:auth/session_bypass with entity @s

execute if score @s tinyauth.session_delta matches 601.. run function tiny_auth:auth/enforce_login with entity @s
