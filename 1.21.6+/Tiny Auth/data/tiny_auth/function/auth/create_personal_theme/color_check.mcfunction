$execute if data storage tiny_auth:storage colors.$(input) run return 1

scoreboard players set #ColorTest tinyauth.auth.temp 0
$execute store result score #ColorTest tinyauth.auth.temp run function tiny_auth:auth/create_personal_theme/test {input:"$(input)"}
execute if score #ColorTest tinyauth.auth.temp matches 1 run return 1

return 0
