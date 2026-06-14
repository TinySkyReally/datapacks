execute unless data storage tiny_auth:config {experimental_session_login:1b} run return run function tiny_auth:auth/enforce_login with entity @s
$data modify storage tiny_auth:temp auth_session set from storage tiny_auth:storage auths[{UUID:$(UUID)}]
execute if data storage tiny_auth:temp {auth_session:{password:""}} run return run function tiny_auth:auth/enforce_login with entity @s

scoreboard players set @s tinyauth.auth.logged_in 1

scoreboard players set @s tinyauth.auth.gui_opened 0

function tiny_auth:debug/send_info/with_me {info:{"text":"Session restored! Welcome back.","color":"green"}}
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 1.5
