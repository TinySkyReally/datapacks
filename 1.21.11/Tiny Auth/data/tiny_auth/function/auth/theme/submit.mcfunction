scoreboard players reset @s tinyauth.auth.theme.submit

execute unless score @s tinyauth.auth.state matches 4 run return 0

function tiny_auth:auth/reset
function tiny_auth:auth/success with storage tiny_auth:temp auth
