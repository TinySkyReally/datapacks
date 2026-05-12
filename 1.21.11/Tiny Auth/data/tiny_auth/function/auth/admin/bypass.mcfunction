$data modify storage tiny_auth:temp bypass set from storage tiny_auth:keys auths[{Name:$(Name)}]

$execute as $(Name) run function tiny_auth:auth/reset
$execute as $(Name) run function tiny_auth:auth/success with storage tiny_auth:temp bypass
$dialog clear $(Name)
