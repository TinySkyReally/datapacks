scoreboard players add @s tinyauth.auth.log_player 1
execute store result score #max_player tinyauth.auth.temp run data get storage tiny_auth:storage unique_players
execute if score @s tinyauth.auth.log_player >= #max_player tinyauth.auth.temp run scoreboard players set @s tinyauth.auth.log_player -1
execute unless score @s tinyauth.auth.log_player matches -1.. run scoreboard players set @s tinyauth.auth.log_player -1

function tiny_auth:auth/admin/control_gui/action/init_page {page:6}
