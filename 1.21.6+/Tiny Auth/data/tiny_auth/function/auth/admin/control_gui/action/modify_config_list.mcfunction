$execute if score #adaction tinyauth.auth.temp matches 1..$(config_max) run function tiny_auth:auth/admin/control_gui/action/modify_config_list/setup with storage tiny_auth:temp control_panel_send
$execute if score #adaction tinyauth.auth.temp matches $(config_max_1) run function tiny_auth:auth/admin/control_gui/action/init_page {page:2}
