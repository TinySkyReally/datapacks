#remaining, UUID
data modify storage tiny_auth:temp control_panel.loopitem set from storage tiny_auth:temp control_panel.logs_view_loop[0]

function tiny_auth:auth/admin/control_gui/init/log_view_setup/loop/add_filter with storage tiny_auth:temp control_panel

data remove storage tiny_auth:temp control_panel.logs_view_loop[0]

execute store result score #lengthLogs tinyauth.auth.temp run data get storage tiny_auth:temp control_panel.logs_view_loop
execute if score #lengthLogs tinyauth.auth.temp matches 1.. run function tiny_auth:auth/admin/control_gui/init/log_view_setup/loop with storage tiny_auth:temp control_panel
