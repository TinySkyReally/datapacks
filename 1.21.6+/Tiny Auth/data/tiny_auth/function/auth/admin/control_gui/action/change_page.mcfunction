$scoreboard players $(change) @s tinyauth.auth.log_page 1
execute if score @s tinyauth.auth.log_page matches ..-1 run scoreboard players set @s tinyauth.auth.log_page 0

function tiny_auth:auth/admin/control_gui/action/init_page {page:6}
