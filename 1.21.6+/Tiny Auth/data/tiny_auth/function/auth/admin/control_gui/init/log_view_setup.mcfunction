data modify storage tiny_auth:temp control_panel.logs_view_loop set from storage tiny_auth:temp control_panel.logs
function tiny_auth:auth/admin/control_gui/init/log_view_setup/loop with storage tiny_auth:temp control_panel

execute store result score #skip tinyauth.auth.temp run data get storage tiny_auth:temp control_panel.log_page
execute store result score #limit tinyauth.auth.temp run data get storage tiny_auth:temp control_panel.log_limit
scoreboard players operation #skip tinyauth.auth.temp *= #limit tinyauth.auth.temp

data modify storage tiny_auth:temp control_panel.logs_to_display set value []

function tiny_auth:auth/admin/control_gui/init/log_view_setup/crop_skip
function tiny_auth:auth/admin/control_gui/init/log_view_setup/crop_take

execute if data storage tiny_auth:temp {control_panel:{logs_to_display:[]}} run data modify storage tiny_auth:temp control_panel.logs_to_display append value {text:"No logs available."}
