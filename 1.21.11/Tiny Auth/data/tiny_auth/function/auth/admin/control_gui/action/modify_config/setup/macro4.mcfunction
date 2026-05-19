data modify storage tiny_auth:temp changeInputNumpad.UUID set from entity @s UUID
$data modify storage tiny_auth:temp changeInputNumpad.id set value "$(id)"
$data modify storage tiny_auth:temp changeInputNumpad.page set value $(page)
function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro4/macro with storage tiny_auth:temp changeInputNumpad

$function tiny_auth:auth/admin/control_gui/action/init_page {page:$(page)}
