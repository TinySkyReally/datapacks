scoreboard players reset @s tinyauth.auth.submit

execute if score @s tinyauth.auth.gui_opened matches 0 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

$data modify storage tiny_auth:temp auth set from storage tiny_auth:storage auths[{UUID:$(UUID)}]

$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts set value 5
$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts set from storage tiny_auth:config lock_attempts

$execute store result score #lockAttempts tinyauth.auth.temp run data get storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts

$execute unless score @s tinyauth.auth.state matches 6 if score #lockAttempts tinyauth.auth.temp matches ..0 run return run function tiny_auth:auth/init {UUID:$(UUID),message:-1,submit:"",state:-1}

execute if score @s tinyauth.auth.state matches 6 if function tiny_auth:auth/check/otp_test run scoreboard players set #OTPTest tinyauth.auth.temp 0
execute if score @s tinyauth.auth.state matches 6 unless function tiny_auth:auth/check/otp_test run scoreboard players set #OTPTest tinyauth.auth.temp 1
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:auth/reset
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:logs/new/with_me {filter:"Resets",action:"recovery_login",reason:"used_otp_code"}
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:debug/send_info/with_me {info:{"text":"Successfully logged in via Recovery Code!","color":"green"}}
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run function tiny_auth:auth/generate_otp/new with entity @s
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 1 run return run function tiny_auth:auth/success with storage tiny_auth:temp auth
execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 0 run function tiny_auth:auth/reset_input with entity @s
$execute if score @s tinyauth.auth.state matches 6 if score #OTPTest tinyauth.auth.temp matches 0 run return run function tiny_auth:auth/init {UUID:$(UUID),message:"enter_otp",submit:"Submit",state:6}

execute if score @s tinyauth.auth.state matches 5 run data modify storage tiny_auth:temp cpt.UUID set from entity @s UUID
execute if score @s tinyauth.auth.state matches 5 run data modify storage tiny_auth:temp cpt.key set from storage tiny_auth:temp auth.key
execute if score @s tinyauth.auth.state matches 5 run return run function tiny_auth:auth/create_personal_theme/submit with storage tiny_auth:temp cpt

$execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].key set value "key_submit"
execute if score @s tinyauth.auth.state matches 4 run function tiny_auth:auth/reset_input with entity @s
execute if score @s tinyauth.auth.state matches 4 run return run function tiny_auth:auth/create_personal_theme/init with entity @s

$execute if score @s tinyauth.auth.state matches 3 store result score @s tinyauth.auth.temp run data get storage tiny_auth:storage auths[{UUID:$(UUID)}].time
execute if score @s tinyauth.auth.state matches 3 store result score #time tinyauth.auth.temp run time query gametime
$execute if score @s tinyauth.auth.state matches 3 if score @s tinyauth.auth.temp >= #time tinyauth.auth.temp run return run function tiny_auth:auth/init {UUID:$(UUID),message:"blocked",submit:"",state:3}

scoreboard players set #checkContains tinyauth.auth.temp 0
execute if score @s tinyauth.auth.state matches 2 run scoreboard players set #checkContains tinyauth.auth.temp 1
execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run scoreboard players set #checkContains tinyauth.auth.temp 1

execute store result score #input tinyauth.auth.temp run data get storage tiny_auth:temp auth.input
execute store result score #max_password_length tinyauth.auth.temp run data get storage tiny_auth:config max_password_length
execute store result score #min_password_length tinyauth.auth.temp run data get storage tiny_auth:config min_password_length

$data modify storage tiny_auth:temp PasswordLength set value {UUID:$(UUID),message:"-1",submit:"",state:1}
execute store result storage tiny_auth:temp PasswordLength.state int 1 run scoreboard players get @s tinyauth.auth.state

execute if score #checkContains tinyauth.auth.temp matches 1 if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run data modify storage tiny_auth:temp PasswordLength.message set value "length_limit"
execute if score #checkContains tinyauth.auth.temp matches 1 if score #input tinyauth.auth.temp > #max_password_length tinyauth.auth.temp run return run function tiny_auth:auth/init with storage tiny_auth:temp PasswordLength

execute if score #checkContains tinyauth.auth.temp matches 1 if score #input tinyauth.auth.temp < #min_password_length tinyauth.auth.temp run data modify storage tiny_auth:temp PasswordLength.message set value "short_password"
execute if score #checkContains tinyauth.auth.temp matches 1 if score #input tinyauth.auth.temp < #min_password_length tinyauth.auth.temp run return run function tiny_auth:auth/init with storage tiny_auth:temp PasswordLength

$data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].input_contains_number
$data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].input_contains_letter
$data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].input_contains_symbol

data modify storage tiny_auth:temp PasswordContainsLoop.remaining set from storage tiny_auth:temp auth.input
$data modify storage tiny_auth:temp PasswordContainsLoop.UUID set value $(UUID)
function tiny_auth:auth/check/contains with storage tiny_auth:temp PasswordContainsLoop
function tiny_auth:auth/check/weak_passwords with storage tiny_auth:temp PasswordContainsLoop

$data modify storage tiny_auth:temp auth set from storage tiny_auth:storage auths[{UUID:$(UUID)}]

$data modify storage tiny_auth:temp PasswordContains set value {UUID:$(UUID),message:"-1",submit:"",state:1}
execute store result storage tiny_auth:temp PasswordContains.state int 1 run scoreboard players get @s tinyauth.auth.state

execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {must_contain_number:1b} unless data storage tiny_auth:temp auth.input_contains_number run data modify storage tiny_auth:temp PasswordContains.message set value "doesnt_contain_number"
execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {must_contain_number:1b} unless data storage tiny_auth:temp auth.input_contains_number run return run function tiny_auth:auth/init with storage tiny_auth:temp PasswordContains

execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {must_contain_letter:1b} unless data storage tiny_auth:temp auth.input_contains_letter run data modify storage tiny_auth:temp PasswordContains.message set value "doesnt_contain_letter"
execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {must_contain_letter:1b} unless data storage tiny_auth:temp auth.input_contains_letter run return run function tiny_auth:auth/init with storage tiny_auth:temp PasswordContains

execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {block_common_password:1b} unless data storage tiny_auth:temp auth.is_input_weak run data modify storage tiny_auth:temp PasswordContains.message set value "weak_password"
execute if score #checkContains tinyauth.auth.temp matches 1 if data storage tiny_auth:config {block_common_password:1b} unless data storage tiny_auth:temp auth.is_input_weak run return run function tiny_auth:auth/init with storage tiny_auth:temp PasswordContains

execute if score @s tinyauth.auth.state matches 2 run function tiny_auth:auth/reset
execute if score @s tinyauth.auth.state matches 2 run function tiny_auth:debug/send_info/with_me {info:{"text":"Successfully changed password!","color":"green"}}
$execute if score @s tinyauth.auth.state matches 2 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].password set from storage tiny_auth:temp auth.input_hash
$execute if score @s tinyauth.auth.state matches 2 if data storage tiny_auth:storage auths[{UUID:$(UUID)}].new_security_hash_set run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].new_security_hash_set
execute if score @s tinyauth.auth.state matches 2 run function tiny_auth:logs/new/with_me {filter:"Resets",action:"password_changed",reason:"user_updated"}
execute if score @s tinyauth.auth.state matches 2 run return run function tiny_auth:auth/success with storage tiny_auth:temp auth

scoreboard players set #newpassword tinyauth.auth.temp 0
execute if data storage tiny_auth:temp {auth:{password:""}} unless data storage tiny_auth:temp {auth:{input:""}} run scoreboard players set #newpassword tinyauth.auth.temp 1
execute if score #newpassword tinyauth.auth.temp matches 1 run function tiny_auth:auth/reset
execute if score #newpassword tinyauth.auth.temp matches 1 run function tiny_auth:auth/success with storage tiny_auth:temp auth
execute if score #newpassword tinyauth.auth.temp matches 1 run function tiny_auth:debug/send_info/with_me {info:{"text":"Successfully registered!","color":"green"}}
execute if score #newpassword tinyauth.auth.temp matches 1 run function tiny_auth:auth/generate_otp/new with entity @s
execute if score #newpassword tinyauth.auth.temp matches 1 run function tiny_auth:logs/new/with_me {filter:"All",action:"account_registered",reason:"first_time_setup"}
$execute if score #newpassword tinyauth.auth.temp matches 1 run return run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].password set from storage tiny_auth:storage auths[{UUID:$(UUID)}].input_hash

scoreboard players set #correctpassword tinyauth.auth.temp 0
execute unless data storage tiny_auth:temp {auth:{password:""}} unless function tiny_auth:auth/check/test run scoreboard players set #correctpassword tinyauth.auth.temp 1
execute if score #correctpassword tinyauth.auth.temp matches 1 run function tiny_auth:auth/reset
execute if score #correctpassword tinyauth.auth.temp matches 1 run function tiny_auth:auth/success with storage tiny_auth:temp auth
$execute if score #correctpassword tinyauth.auth.temp matches 1 run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts
$execute if score #correctpassword tinyauth.auth.temp matches 1 run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts
execute if score #correctpassword tinyauth.auth.temp matches 1 run function tiny_auth:logs/new/with_me {filter:"All",action:"login_success",reason:"password_correct"}
execute if score #correctpassword tinyauth.auth.temp matches 1 run return run function tiny_auth:debug/send_info/with_me {info:{"text":"Successfully logged in!","color":"green"}}

playsound minecraft:block.note_block.iron_xylophone ui @s ~ ~ ~ 100 .1

function tiny_auth:auth/reset_input with entity @s
execute unless data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/wrong_password with entity @s
$execute if data storage tiny_auth:temp {auth:{input:""}} run function tiny_auth:auth/init {UUID:$(UUID),message:"empty",submit:"",state:1}

#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}] run data modify storage tiny_auth:storage auths append value {UUID:$(UUID),password:"",input:""}
