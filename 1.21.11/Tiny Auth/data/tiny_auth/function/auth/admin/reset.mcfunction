$execute unless entity @a[name=$(Name)] run tellraw @s [{text:"This player is currently offline. If they have changed their name, the system may not reflect the update yet.",color:"red"}]

$data modify storage tiny_auth:keys auths[{Name:"$(Name)"}].password set value ""

$tellraw @s [{text:"Successfully reset $(Name)'s password!",color:"green"}]

function tiny_auth:logs/new/with_me {filter:"Resets",action:"password_wiped",reason:"admin_forced_reset"}
