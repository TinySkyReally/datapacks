execute if score #limit tinyauth.auth.temp matches 1.. if data storage tiny_auth:temp control_panel.logs_view[0] run data modify storage tiny_auth:temp control_panel.logs_to_display append from storage tiny_auth:temp control_panel.logs_view[0]
execute if score #limit tinyauth.auth.temp matches 1.. if data storage tiny_auth:temp control_panel.logs_view[0] run data remove storage tiny_auth:temp control_panel.logs_view[0]
execute if score #limit tinyauth.auth.temp matches 1.. run scoreboard players remove #limit tinyauth.auth.temp 1
execute if score #limit tinyauth.auth.temp matches 1.. run function tiny_auth:auth/admin/control_gui/init/log_view_setup/crop_take
