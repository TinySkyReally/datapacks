scoreboard players reset @s tinyauth.auth.theme.title

execute unless score @s tinyauth.auth.state matches 4 run return 0

$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].key set value "key_title"
function tiny_auth:auth/reset_input with entity @s
function tiny_auth:auth/create_personal_theme/init with entity @s
