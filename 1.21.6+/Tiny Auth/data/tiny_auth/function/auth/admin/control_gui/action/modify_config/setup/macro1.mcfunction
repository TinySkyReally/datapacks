#id:"name", type:"int", label:"Name", admin_input:["toggle","numpad","floatnumpad","list"]
#pages_ids:{0:main_menu,1:keypad,2:modify_config_menu}

$data modify storage tiny_auth:temp control_panel.input_info set value {id:"$(id)",type:"$(type)",label:"$(label)"}

$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"toggle"}}} if data storage tiny_auth:config {admin:{$(id):0b}} run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro2 {id:$(id),set:1}
$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"toggle"}}} if data storage tiny_auth:config {admin:{$(id):1b}} run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro2 {id:$(id),set:0}
$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"toggle"}}} unless data storage tiny_auth:config admin.$(id) run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro2 {id:$(id),set:1}
$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"toggle"}}} if data storage tiny_auth:config admin.$(id) run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro2 {id:$(id),set:1}

#{label:"minecraft:overworld",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 1"}}, {label:"minecraft:the_nether",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 2"}}, {label:"minecraft:the_end",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 3"}}
$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"list"}}} run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro3 {id:$(id)}

$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"numpad"}}} run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro4 {id:$(id),page:4}
$execute if data storage tiny_auth:temp {control_gui:{modify_config:{admin_input:"floatnumpad"}}} run return run function tiny_auth:auth/admin/control_gui/action/modify_config/setup/macro4 {id:$(id),page:5}


function tiny_auth:auth/admin/control_gui/action/init_page {page:1}
