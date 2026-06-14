#{label:"minecraft:overworld",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 1"}}, {label:"minecraft:the_nether",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 2"}}, {label:"minecraft:the_end",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 3"}}
#First we need to run this list: ["a","b","c"] into this: [{label:"1",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set 1"}},...]
function tiny_auth:config/setup/admin_config

$function tiny_auth:config/setup/config_info/list {id:$(id)}

$data modify storage tiny_auth:temp control_gui_send.id set value "$(id)"
function tiny_auth:auth/admin/control_gui/action/init_page {page:3}

