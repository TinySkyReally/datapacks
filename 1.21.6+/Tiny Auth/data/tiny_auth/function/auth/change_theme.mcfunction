scoreboard players reset @s tinyauth.auth.change_theme

execute if score @s tinyauth.auth.gui_opened matches 0 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].key set value "key_theme"
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

execute store result storage tiny_auth:temp change_theme.theme_id int 1 run scoreboard players add @s tinyauth.auth.theme_id 1
data modify storage tiny_auth:temp change_theme.UUID set from entity @s UUID

function tiny_auth:auth/change_theme/macro with storage tiny_auth:temp change_theme
