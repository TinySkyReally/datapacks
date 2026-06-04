data modify storage tiny_auth:keys auths[].password set value ""

tellraw @s [{text:"Successfully reset all player passwords!",color:"green"}]
