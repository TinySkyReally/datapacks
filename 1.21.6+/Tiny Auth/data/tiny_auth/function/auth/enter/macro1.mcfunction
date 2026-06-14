$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].key set value "keyboard_$(textLower)"
execute if score @s tinyauth.auth.state matches 4 run function tiny_auth:auth/reset_input with entity @s
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

$data modify storage tiny_auth:temp inputSet set value "$(input)$(text)"

execute store result score #input tinyauth.auth.temp run data get storage tiny_auth:temp inputSet
execute store result score #max_password_length tinyauth.auth.temp run data get storage tiny_auth:config max_password_length
$execute unless score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].input set value "$(input)$(text)"
$execute unless score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].input_hash set value "$(input_hash)$(text_hash)"

execute unless score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run playsound minecraft:block.note_block.iron_xylophone ui @s ~ ~ ~ 100 2
execute if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run playsound minecraft:block.iron_trapdoor.open ui @s ~ ~ ~ 100 2

$data modify storage tiny_auth:temp initEnter set value {UUID:$(UUID),message:-1,submit:-1,state:1,page:-1}
execute store result storage tiny_auth:temp initEnter.state int 1 run scoreboard players get @s tinyauth.auth.state

execute if score @s tinyauth.auth.state matches 7 if score @s tinyauth.auth.page matches 4..5 run scoreboard players set #testnumber tinyauth.auth.temp 0
$execute if score @s tinyauth.auth.state matches 7 if score @s tinyauth.auth.page matches 4..5 store result score #testnumber tinyauth.auth.temp run function tiny_auth:auth/enter/macro2 with storage tiny_auth:storage auths[{UUID:$(UUID)}]
execute if score @s tinyauth.auth.state matches 7 if score @s tinyauth.auth.page matches 4..5 if score #testnumber tinyauth.auth.temp matches 0 run data modify storage tiny_auth:temp initEnter.numpadColor set value "red"
execute if score @s tinyauth.auth.state matches 7 if score @s tinyauth.auth.page matches 4..5 unless score #testnumber tinyauth.auth.temp matches 0 run data modify storage tiny_auth:temp initEnter.numpadColor set value "green"

execute if score @s tinyauth.auth.state matches 7 run return run function tiny_auth:auth/admin/control_gui/init with storage tiny_auth:temp initEnter

execute if score @s tinyauth.auth.state matches 5 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

function tiny_auth:auth/init with storage tiny_auth:temp initEnter
