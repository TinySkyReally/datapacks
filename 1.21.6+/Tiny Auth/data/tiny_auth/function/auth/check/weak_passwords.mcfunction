scoreboard players set #is_weak_password tinyauth.auth.temp 0

execute if data storage tiny_auth:temp {auth:{input:"12345678"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"123456789"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"87654321"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"00000000"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"11111111"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1

execute if data storage tiny_auth:temp {auth:{input:"QWERTYUI"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"QWERTYUIOP"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"ASDFGHJKL"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1

execute if data storage tiny_auth:temp {auth:{input:"PASSWORD"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"PASSWORD123"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"ADMIN123"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"ADMIN1234"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"ADMINISTRATOR"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1

execute if data storage tiny_auth:temp {auth:{input:"MINECRAFT"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"MINECRAFT123"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"MOJANG123"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"MICROSOFT"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1

execute if data storage tiny_auth:temp {auth:{input:"ILOVEYOU"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"SUNSHINE"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"WELCOME123"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{input:"FOOTBALL"}} run scoreboard players set #is_weak_password tinyauth.auth.temp 1

$execute if score #is_weak_password tinyauth.auth.temp matches 1 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].is_input_weak set value 1b
