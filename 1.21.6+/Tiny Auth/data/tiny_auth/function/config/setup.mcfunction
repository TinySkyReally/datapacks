function tiny_auth:config/setup/admin_config

function tiny_auth:config/setup/config_info

$data modify storage tiny_auth:config theme_id set from storage tiny_auth:visuals themes[{name:"$(theme)"}].id
$data modify storage tiny_auth:config language_id set from storage tiny_auth:visuals languages[{name:"$(language)"}].id
