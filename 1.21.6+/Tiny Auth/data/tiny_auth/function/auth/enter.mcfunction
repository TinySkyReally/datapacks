#function tiny_auth:auth/enter {key:"a",text:"A"}

scoreboard players reset @s tinyauth.auth.enter

execute if score @s tinyauth.auth.gui_opened matches 0 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

$data modify storage tiny_auth:temp enter.text set from storage tiny_auth:storage character_map."$(id)"
data modify storage tiny_auth:temp enter.UUID set from entity @s UUID

$scoreboard players set #char_id tinyauth.auth.temp $(id)

scoreboard players set #multiplier tinyauth.auth.temp 33
scoreboard players operation @s tinyauth.hash_state *= #multiplier tinyauth.auth.temp
scoreboard players operation @s tinyauth.hash_state += #char_id tinyauth.auth.temp

scoreboard players set #alphabet_size tinyauth.auth.temp 43
scoreboard players operation @s tinyauth.hash_state %= #alphabet_size tinyauth.auth.temp

execute store result storage tiny_auth:temp enter.scrambled_id int 1 run scoreboard players get @s tinyauth.hash_state

function tiny_auth:auth/enter/macro3 with storage tiny_auth:temp enter
