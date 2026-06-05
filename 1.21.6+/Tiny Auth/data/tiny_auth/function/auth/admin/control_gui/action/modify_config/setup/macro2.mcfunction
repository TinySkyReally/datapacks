$data modify storage tiny_auth:config admin.$(id) set value $(set)b

function tiny_auth:config/setup/admin_config

$data modify storage tiny_auth:storage config_info[{id:"$(id)"}]."tooltip" set value {text:"None"}
$function tiny_auth:config/setup/config_info/macro1 with storage tiny_auth:storage config_info[{id:"$(id)"}]

function tiny_auth:auth/admin/control_gui/action/init_page {page:2}
