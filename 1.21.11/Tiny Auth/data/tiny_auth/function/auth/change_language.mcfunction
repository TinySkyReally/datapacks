scoreboard players reset @s tinyauth.auth.change_language

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].key set value "key_language"
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

execute store result storage tiny_auth:temp change_language.language_id int 1 run scoreboard players add @s tinyauth.auth.language_id 1
data modify storage tiny_auth:temp change_language.UUID set from entity @s UUID

function tiny_auth:auth/change_language/macro with storage tiny_auth:temp change_language
