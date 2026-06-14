$data modify storage tiny_auth:temp control_panel_send.config_info set from storage tiny_auth:storage config_info[{id:$(id)}].list_view
$execute store result storage tiny_auth:temp control_panel_send.config_max int 1 run data get storage tiny_auth:storage config_info[{id:$(id)}].list_view
$execute store result score #control_panel_send tinyauth.auth.temp run data get storage tiny_auth:storage config_info[{id:$(id)}].list_view
scoreboard players add #control_panel_send tinyauth.auth.temp 1
execute store result storage tiny_auth:temp control_panel_send.config_max_1 int 1 run scoreboard players get #control_panel_send tinyauth.auth.temp
$data modify storage tiny_auth:temp control_panel_send.id set value "$(id)"

function tiny_auth:auth/admin/control_gui/setup_page/page3/macro with storage tiny_auth:temp control_panel_send
