$execute if data storage tiny_auth:config {$(id):"$(cur)"} run data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view[$(item)]."label".color set value "#55FF55"
$execute unless data storage tiny_auth:config {$(id):"$(cur)"} run data modify storage tiny_auth:storage config_info[{id:"$(id)"}].list_view[$(item)]."label".color set value "#AAAAAA"
