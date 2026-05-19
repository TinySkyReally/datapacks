scoreboard players reset #adaction tinyauth.auth.temp
scoreboard players operation #adaction tinyauth.auth.temp = @s tinyauth.auth.control_panel.action
scoreboard players reset @s tinyauth.auth.control_panel.action

execute if score @s tinyauth.auth.page matches 0 if score #adaction tinyauth.auth.temp matches 1 run return run function tiny_auth:auth/admin/control_gui/action/init_page {page:2}
execute if score @s tinyauth.auth.page matches 0 if score #adaction tinyauth.auth.temp matches 2 run return run function tiny_auth:auth/admin/control_gui
execute if score @s tinyauth.auth.page matches 0 if score #adaction tinyauth.auth.temp matches 3 run return run function tiny_auth:auth/admin/control_gui
execute if score @s tinyauth.auth.page matches 0 if score #adaction tinyauth.auth.temp matches 4 run return run function tiny_auth:auth/admin/control_gui/action/exit with entity @s

execute if score @s tinyauth.auth.page matches 2 if score #adaction tinyauth.auth.temp matches 1.. run return run function tiny_auth:auth/admin/control_gui/action/modify_config with storage tiny_auth:temp control_panel

execute if score @s tinyauth.auth.page matches 3 if score #adaction tinyauth.auth.temp matches 1.. run return run function tiny_auth:auth/admin/control_gui/action/modify_config_list with storage tiny_auth:temp control_panel_send

execute if score @s tinyauth.auth.page matches 4..5 if score #adaction tinyauth.auth.temp matches 1 run return run function tiny_auth:auth/admin/control_gui/action/submit with entity @s
execute if score @s tinyauth.auth.page matches 4..5 if score #adaction tinyauth.auth.temp matches 2 run return run function tiny_auth:auth/admin/control_gui/action/clear with entity @s
execute if score @s tinyauth.auth.page matches 4..5 if score #adaction tinyauth.auth.temp matches 3 run return run function tiny_auth:auth/admin/control_gui/action/init_page {page:2}
