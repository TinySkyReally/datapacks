#$data modify storage tiny_auth:temp control_gui.modify_config.id set from storage tiny_auth:storage config_info[{id:$(id)}].list[$(item)]."label".text

$data modify storage tiny_auth:config admin.$(id) set from storage tiny_auth:storage config_info[{id:$(id)}].list[$(item)]

function tiny_auth:config/setup/admin_config

$data modify storage tiny_auth:storage config_info[{id:"$(id)"}]."tooltip" set value {text:"None"}
$function tiny_auth:config/setup/config_info/macro1 with storage tiny_auth:storage config_info[{id:"$(id)"}]

$function tiny_auth:config/setup/config_info/list {id:$(id)}

$data modify storage tiny_auth:temp control_gui_send.id set value "$(id)"
function tiny_auth:auth/admin/control_gui/action/init_page {page:3}
