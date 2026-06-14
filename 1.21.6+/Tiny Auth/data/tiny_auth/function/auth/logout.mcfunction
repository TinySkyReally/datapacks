scoreboard players reset @s tinyauth.auth.logout

execute if score @s tinyauth.auth.gui_opened matches 1 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

data modify storage tiny_auth:temp init.UUID set from entity @s UUID
data modify storage tiny_auth:temp init.message set value ""
data modify storage tiny_auth:temp init.submit set value ""
data modify storage tiny_auth:temp init.state set value -1

function tiny_auth:auth/reset_input with entity @s

function tiny_auth:auth/init with storage tiny_auth:temp init
