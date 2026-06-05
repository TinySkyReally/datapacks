execute unless score @s tinyauth.auth.theme_id matches -2147483647..2147483647 store result score @s tinyauth.auth.theme_id run data get storage tiny_auth:config theme_id
execute unless score @s tinyauth.auth.language_id matches -2147483647..2147483647 store result score @s tinyauth.auth.language_id run data get storage tiny_auth:config language_id

execute unless score @s tinyauth.detection.leave_game matches 0 run function tiny_auth:tick/player/leave_game with entity @s

execute if score @s tinyauth.auth.logged_in matches 1 run scoreboard players operation @s tinyauth.last_seen = #current_tick tinyauth.auth.temp

function tiny_auth:auth/keys with entity @s
function tiny_auth:auth/update with entity @s
