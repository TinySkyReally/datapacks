$data modify storage tiny_auth:temp control_gui.modify_config.id set from storage tiny_auth:storage config_info[$(id)].id
$data modify storage tiny_auth:temp control_gui.modify_config.type set from storage tiny_auth:storage config_info[$(id)].type
$data modify storage tiny_auth:temp control_gui.modify_config.admin_input set from storage tiny_auth:storage config_info[$(id)].admin_input
$data modify storage tiny_auth:temp control_gui.modify_config.label set from storage tiny_auth:storage config_info[$(id)].label

function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro1 with storage tiny_auth:temp control_gui.modify_config
