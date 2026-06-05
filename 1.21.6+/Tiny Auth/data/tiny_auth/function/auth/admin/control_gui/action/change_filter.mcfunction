scoreboard players add @s tinyauth.auth.log_filter 1
execute if score @s tinyauth.auth.log_filter matches 4.. run scoreboard players set @s tinyauth.auth.log_filter 0
execute unless score @s tinyauth.auth.log_filter matches 0.. run scoreboard players set @s tinyauth.auth.log_filter 0

function tiny_auth:auth/admin/control_gui/action/init_page {page:6}
