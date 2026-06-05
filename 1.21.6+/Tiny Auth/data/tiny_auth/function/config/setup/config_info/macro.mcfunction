#item -1
$data modify storage tiny_auth:storage config_info[$(item)]."action" set value {"type":"minecraft:run_command","command":"/trigger tinyauth.auth.control_panel.action set $(item1)"}
$data modify storage tiny_auth:storage config_info[$(item)]."tooltip" set value {text:"None"}
$function tiny_auth:config/setup/config_info/macro1 with storage tiny_auth:storage config_info[$(item)]

$scoreboard players set #config_info_loop tinyauth.auth.temp $(item)
scoreboard players remove #config_info_loop tinyauth.auth.temp 1
execute if score #config_info_loop tinyauth.auth.temp matches ..-1 run return 0

execute store result storage tiny_auth:temp config_info.item int 1 run scoreboard players get #config_info_loop tinyauth.auth.temp
execute store result storage tiny_auth:temp config_info.item1 int 1 run scoreboard players add #config_info_loop tinyauth.auth.temp 1

function tiny_auth:config/setup/config_info/macro with storage tiny_auth:temp config_info
