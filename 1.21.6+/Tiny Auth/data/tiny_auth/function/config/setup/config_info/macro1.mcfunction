$data modify storage tiny_auth:temp config_info.value set from storage tiny_auth:config $(id)
data modify storage tiny_auth:temp config_info.color set value "gold"
$data modify storage tiny_auth:temp config_info.id set value $(id)

$data modify storage tiny_auth:temp config_info_check set from storage tiny_auth:storage config_info[{id:"$(id)"}]

execute if data storage tiny_auth:temp {config_info:{value:1b}} run data modify storage tiny_auth:temp config_info.color set value "#55FF55"
execute if data storage tiny_auth:temp {config_info:{value:1b}} run data modify storage tiny_auth:temp config_info.value set value "Enabled"

execute if data storage tiny_auth:temp {config_info:{value:0b}} run data modify storage tiny_auth:temp config_info.color set value "#FF5555"
execute if data storage tiny_auth:temp {config_info:{value:0b}} run data modify storage tiny_auth:temp config_info.value set value "Disabled"

execute if data storage tiny_auth:temp {config_info_check:{type:"int"}} run data modify storage tiny_auth:temp config_info.color set value "#55FFFF"
execute if data storage tiny_auth:temp {config_info_check:{type:"int"}} if data storage tiny_auth:temp {config_info:{value:0}} run data modify storage tiny_auth:temp config_info.color set value "#00AAAA"

execute if data storage tiny_auth:temp {config_info_check:{type:"double"}} run data modify storage tiny_auth:temp config_info.color set value "#77A9FF"

execute if data storage tiny_auth:temp {config_info_check:{type:"float"}} run data modify storage tiny_auth:temp config_info.color set value "#AADDFF"

execute if data storage tiny_auth:temp {config_info_check:{type:"string"}} run data modify storage tiny_auth:temp config_info.color set value "#FFFF55"

function tiny_auth:config/setup/config_info/macro2 with storage tiny_auth:temp config_info
