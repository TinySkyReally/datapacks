$execute store result storage tiny_auth:temp config_info_list.item1 int 1 run data get storage tiny_auth:storage config_info[{id:"$(id)"}].list

$execute store result score #config_info_list_max tinyauth.auth.temp run data get storage tiny_auth:storage config_info[{id:"$(id)"}].list
scoreboard players remove #config_info_list_max tinyauth.auth.temp 1
execute store result storage tiny_auth:temp config_info_list.item int 1 run scoreboard players get #config_info_list_max tinyauth.auth.temp

$data modify storage tiny_auth:temp config_info_list.id set value "$(id)"

$data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view set from storage tiny_auth:storage config_info[{id:"$(id)"}].list

function tiny_auth:config/setup/config_info/list/macro with storage tiny_auth:temp config_info_list
