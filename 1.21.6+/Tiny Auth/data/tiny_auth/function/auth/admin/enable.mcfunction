$data modify storage tiny_auth:temp init.UUID set from storage tiny_auth:keys auths[{Name:$(Name)}].UUID
data modify storage tiny_auth:temp init.message set value ""
data modify storage tiny_auth:temp init.submit set value ""
data modify storage tiny_auth:temp init.state set value 1

$execute as $(Name) run function tiny_auth:auth/reset_input with entity @s

$execute as $(Name) run function tiny_auth:auth/init with storage tiny_auth:temp init
