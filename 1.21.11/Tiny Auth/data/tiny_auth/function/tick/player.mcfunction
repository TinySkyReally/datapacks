execute unless score @s tinyauth.auth.theme_id matches -2147483647..2147483647 store result score @s tinyauth.auth.theme_id run data get storage tiny_auth:config theme_id
execute unless score @s tinyauth.auth.language_id matches -2147483647..2147483647 store result score @s tinyauth.auth.language_id run data get storage tiny_auth:config language_id

$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:keys auths append value {UUID:$(UUID),password:"",input:""}
$execute if data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:temp plrData set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

$execute if data storage tiny_auth:temp {plrData:{UUID:$(UUID)}} unless data storage tiny_auth:temp plrData.Name in tiny_auth:authdim run loot replace block 1000 0 0 container.0 loot {type:"minecraft:chest",pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:player_head",functions:[{function:"minecraft:fill_player_head",entity:"this"}]}]}],functions:[]}
$execute if data storage tiny_auth:temp {plrData:{UUID:$(UUID)}} unless data storage tiny_auth:temp plrData.Name in tiny_auth:authdim run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].Name set from block 0 0 0 Items[{Slot:0b}].components."minecraft:profile".name

execute unless score @s tinyauth.detection.leave_game matches 0 run function tiny_auth:tick/player/leave_game with entity @s

function tiny_auth:auth/keys with entity @s
function tiny_auth:auth/update with entity @s
