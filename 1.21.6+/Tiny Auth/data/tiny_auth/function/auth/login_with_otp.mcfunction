scoreboard players reset @s tinyauth.auth.login_with_otp

execute if score @s tinyauth.auth.gui_opened matches 0 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

data modify storage tiny_auth:temp init.UUID set from entity @s UUID
data modify storage tiny_auth:temp init.message set value "enter_otp"
data modify storage tiny_auth:temp init.submit set value "Submit"
data modify storage tiny_auth:temp init.state set value 6

$execute if score @s tinyauth.auth.state matches 6 run data modify storage tiny_auth:temp init.message set from storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.message
$execute if score @s tinyauth.auth.state matches 6 run data modify storage tiny_auth:temp init.submit set from storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.submit
$execute if score @s tinyauth.auth.state matches 6 run data modify storage tiny_auth:temp init.state set from storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.state

$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.message set from storage tiny_auth:storage auths[{UUID:$(UUID)}].message
$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.submit set from storage tiny_auth:storage auths[{UUID:$(UUID)}].submit
$execute store result storage tiny_auth:storage auths[{UUID:$(UUID)}].prev.state int 1 run scoreboard players get @s tinyauth.auth.state

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].key set value "key_login_with_otp"
execute if score @s tinyauth.auth.state matches 4 run function tiny_auth:auth/reset_input with entity @s
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

function tiny_auth:auth/reset_input with entity @s

function tiny_auth:auth/init with storage tiny_auth:temp init

