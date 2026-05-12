scoreboard players reset @s tinyauth.auth.submit

$data modify storage tiny_auth:temp auth set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts set value 5
$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts set from storage tiny_auth:config lock_attempts

$execute store result score #lockAttempts tinyauth.auth.temp run data get storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts

$execute unless score @s tinyauth.auth.state matches 6 if score #lockAttempts tinyauth.auth.temp matches ..0 run return run function tiny_auth:auth/init {UUID:$(UUID),message:-1,submit:"",state:-1}

execute if score @s tinyauth.auth.state matches 6 if function tiny_auth:auth/check/otp_test run scoreboard players set #OTPTest tinyauth.auth.temp 0
execute if score @s tinyauth.auth.state matches 6 unless function tiny_auth:auth/check/otp_test run scoreboard players set #OTPTest tinyauth.auth.temp 1
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:auth/reset
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run data remove storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run data remove storage tiny_auth:keys auths[{UUID:$(UUID)}].attempts
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run tellraw @s [{"text":"[Tiny Auth]: Sucesfully logged via Recovery Code!","color":"green"}]
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:auth/generate_otp/new with entity @s
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run return run function tiny_auth:auth/success with storage tiny_auth:temp auth
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 0 run function tiny_auth:auth/reset_input with entity @s
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 0 run return run function tiny_auth:auth/init {UUID:$(UUID),message:"enter_otp",submit:"Submit",state:6}

execute if score @s tinyauth.auth.state matches 5 run data modify storage tiny_auth:temp cpt.UUID set from entity @s UUID
execute if score @s tinyauth.auth.state matches 5 run data modify storage tiny_auth:temp cpt.key set from storage tiny_auth:temp auth.key
execute if score @s tinyauth.auth.state matches 5 run return run function tiny_auth:auth/create_personal_theme/submit with storage tiny_auth:temp cpt

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].key set value "key_submit"
execute if score @s tinyauth.auth.state matches 4 run function tiny_auth:auth/reset_input with entity @s
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

$execute if score @s tinyauth.auth.state matches 3 store result score @s tinyauth.auth.temp run data get storage tiny_auth:keys auths[{UUID:$(UUID)}].time
execute if score @s tinyauth.auth.state matches 3 store result score #time tinyauth.auth.temp run time query gametime
$execute if score @s tinyauth.auth.state matches 3 if score @s tinyauth.auth.temp >= #time tinyauth.auth.temp run return run function tiny_auth:auth/init {UUID:$(UUID),message:"blocked",submit:"",state:3}

execute store result score #input tinyauth.auth.temp run data get storage tiny_auth:temp auth.input
execute store result score #max_password_length tinyauth.auth.temp run data get storage tiny_auth:config max_password_length
$execute if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run data modify storage tiny_auth:temp maxPasswordLength set value {UUID:$(UUID),message:"length_limit",submit:"",state:1}
execute if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp store result storage tiny_auth:temp maxPasswordLength.state int 1 run scoreboard players get @s tinyauth.auth.state
execute if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run function tiny_auth:auth/init with storage tiny_auth:temp maxPasswordLength

execute if score @s tinyauth.auth.state matches 2 run function tiny_auth:auth/reset
execute if score @s tinyauth.auth.state matches 2 run tellraw @s [{"text":"[Tiny Auth]: Sucesfully changed password!","color":"green"}]
$execute if score @s tinyauth.auth.state matches 2 run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].password set from storage tiny_auth:temp auth.input
execute if score @s tinyauth.auth.state matches 2 run return run function tiny_auth:auth/success with storage tiny_auth:temp auth

execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/reset
execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/success with storage tiny_auth:temp auth
execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run tellraw @s [{"text":"[Tiny Auth]: Sucesfully registered!","color":"green"}]
execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/generate_otp/new with entity @s
$execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run return run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].password set from storage tiny_auth:keys auths[{UUID:$(UUID)}].input

execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run function tiny_auth:auth/reset
execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run function tiny_auth:auth/success with storage tiny_auth:temp auth
$execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run data remove storage tiny_auth:keys auths[{UUID:$(UUID)}].lock_attempts
$execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run data remove storage tiny_auth:keys auths[{UUID:$(UUID)}].attempts
execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run return run tellraw @s [{"text":"[Tiny Auth]: Sucesfully logged in!","color":"green"}]

playsound minecraft:block.note_block.iron_xylophone ui @s ~ ~ ~ 100 .1

function tiny_auth:auth/reset_input with entity @s
execute unless data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/wrong_password with entity @s
$execute if data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/init {UUID:$(UUID),message:"empty",submit:"",state:1}

#$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:keys auths append value {UUID:$(UUID),password:"",input:""}
