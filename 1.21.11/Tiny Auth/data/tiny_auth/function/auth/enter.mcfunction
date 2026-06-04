#function tiny_auth:auth/enter {key:"a",text:"A"}

scoreboard players reset @s tinyauth.auth.enter

execute if score @s tinyauth.auth.gui_opened matches 0 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

$data modify storage tiny_auth:temp enter.text set from storage tiny_auth:storage character_map."$(id)"
data modify storage tiny_auth:temp enter.UUID set from entity @s UUID

function tiny_auth:auth/enter/macro with storage tiny_auth:temp enter
