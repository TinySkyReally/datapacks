$execute unless entity @a[name=$(Name)] run return run tellraw @s [{text:"Player $(Name) is currently offline.",color:"red"}]

$data modify storage tiny_auth:temp bypass set from storage tiny_auth:storage auths[{Name:$(Name)}]

$execute as $(Name) run function tiny_auth:auth/reset
$execute as $(Name) run function tiny_auth:auth/success with storage tiny_auth:temp bypass
$dialog clear $(Name)

$tellraw @s [{text:"Successfully bypassed authentication for player $(Name)!",color:"green"}]

function tiny_auth:logs/new/with_me {filter:"All",action:"authentication_bypassed",reason:"admin_forced_authentication_bypass"}
