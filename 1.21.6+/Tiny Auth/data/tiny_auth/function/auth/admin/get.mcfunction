$execute unless entity @a[name=$(Name)] run tellraw @s [{text:"This player is currently offline. If they have changed their name, the system may not reflect the update yet.",color:"red"}]

$data modify storage tiny_auth:temp get set from storage tiny_auth:storage auths[{Name:"$(Name)"}].password

$tellraw @s [{text:"Successfully retrieved $(Name)'s password!",color:"green"}]
