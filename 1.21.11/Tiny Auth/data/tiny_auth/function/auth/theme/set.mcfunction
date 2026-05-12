scoreboard players set @s tinyauth.auth.temp 1
scoreboard players set #TestSecond tinyauth.auth.temp 1

$execute store success score @s tinyauth.auth.temp run data modify storage tiny_auth:temp show_dialog.$(key) set from storage tiny_auth:temp themeSet.$(key)

$execute if score @s tinyauth.auth.temp matches 0 store success score #TestSecond tinyauth.auth.temp run data modify storage tiny_auth:temp show_dialog.$(key) set from storage tiny_auth:temp themeSet.default_key

$execute if score #TestSecond tinyauth.auth.temp matches 0 run data modify storage tiny_auth:temp show_dialog.$(key) set value "white"
