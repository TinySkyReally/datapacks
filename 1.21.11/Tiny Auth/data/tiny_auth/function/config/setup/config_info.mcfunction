execute store result storage tiny_auth:temp config_info.item1 int 1 run data get storage tiny_auth:storage config_info

execute store result score #config_info_max tinyauth.auth.temp run data get storage tiny_auth:storage config_info
scoreboard players remove #config_info_max tinyauth.auth.temp 1
execute store result storage tiny_auth:temp config_info.item int 1 run scoreboard players get #config_info_max tinyauth.auth.temp

function tiny_auth:config/setup/config_info/macro with storage tiny_auth:temp config_info
