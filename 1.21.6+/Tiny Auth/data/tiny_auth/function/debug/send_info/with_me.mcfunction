data modify storage tiny_auth:temp send_info.UUID set from entity @s UUID
$data modify storage tiny_auth:temp send_info.info set value $(info)

function tiny_auth:debug/send_info with storage tiny_auth:temp send_info
