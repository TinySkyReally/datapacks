#item -1, id: "name"
$data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view[$(item)] set value {"label":{text:"None"}}
$data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view[$(item)]."label".text set from storage tiny_auth:storage config_info[{id:"$(id)"}].list[$(item)]
$data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view[$(item)]."action" set value {"type":"minecraft:run_command","command":"/trigger tinyauth.auth.control_panel.action set $(item1)"}

$data modify storage tiny_auth:temp config_info_list.id set value "$(id)"
$data modify storage tiny_auth:temp config_info_list.item set value "$(item)"
$data modify storage tiny_auth:temp config_info_list.cur set from storage tiny_auth:storage config_info[{id:"$(id)"}].list[$(item)]
function tiny_auth:config/setup/config_info/list/macro1 with storage tiny_auth:temp config_info_list

$scoreboard players set #config_info_list_loop tinyauth.auth.temp $(item)
scoreboard players remove #config_info_list_loop tinyauth.auth.temp 1
execute if score #config_info_list_loop tinyauth.auth.temp matches ..-1 run return 0

execute store result storage tiny_auth:temp config_info_list.item int 1 run scoreboard players get #config_info_list_loop tinyauth.auth.temp
execute store result storage tiny_auth:temp config_info_list.item1 int 1 run scoreboard players add #config_info_list_loop tinyauth.auth.temp 1

function tiny_auth:config/setup/config_info/list/macro with storage tiny_auth:temp config_info_list
