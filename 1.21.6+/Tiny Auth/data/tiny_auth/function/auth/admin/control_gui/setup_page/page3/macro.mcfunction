execute if score @s tinyauth.auth.page matches 3 run data modify storage tiny_auth:temp control_panel.contents set value {text:"Modify Config - List"}
$execute if score @s tinyauth.auth.page matches 3 run data modify storage tiny_auth:temp control_panel.actions set value $(config_info)
$execute if score @s tinyauth.auth.page matches 3 run data modify storage tiny_auth:temp control_panel.actions append value {label:"Back",action:{type:"minecraft:run_command",command:"/trigger tinyauth.auth.control_panel.action set $(config_max_1)"}}
