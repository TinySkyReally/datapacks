scoreboard players reset @s tinyauth.auth.clear

function tiny_auth:auth/reset_input with entity @s

$data modify storage tiny_auth:temp initClear set value {UUID:$(UUID),message:"cleared",submit:-1,state:1}
execute store result storage tiny_auth:temp initClear.state int 1 run scoreboard players get @s tinyauth.auth.state

execute if score @s tinyauth.auth.state matches 5 run return run function tiny_auth:auth/create_personal_theme/init with storage tiny_auth:temp initClear

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].key set value "key_clear"
execute if score @s tinyauth.auth.state matches 4 run function tiny_auth:auth/reset_input with entity @s
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

function tiny_auth:auth/init with storage tiny_auth:temp initClear
