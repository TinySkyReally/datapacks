data modify storage tiny_auth:storage auths[].password set value ""

tellraw @s [{text:"Successfully reset all player passwords!",color:"green"}]
