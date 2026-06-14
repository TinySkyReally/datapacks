#coreboard players enable @s tinyauth.auth.enter.1
#coreboard players enable @s tinyauth.auth.enter.2
#coreboard players enable @s tinyauth.auth.enter.3
#coreboard players enable @s tinyauth.auth.enter.4
#coreboard players enable @s tinyauth.auth.enter.5
#coreboard players enable @s tinyauth.auth.enter.6
#coreboard players enable @s tinyauth.auth.enter.7
#coreboard players enable @s tinyauth.auth.enter.8
#coreboard players enable @s tinyauth.auth.enter.9
#coreboard players enable @s tinyauth.auth.enter.0
#coreboard players enable @s tinyauth.auth.enter.q
#coreboard players enable @s tinyauth.auth.enter.w
#coreboard players enable @s tinyauth.auth.enter.e
#coreboard players enable @s tinyauth.auth.enter.r
#coreboard players enable @s tinyauth.auth.enter.t
#coreboard players enable @s tinyauth.auth.enter.y
#coreboard players enable @s tinyauth.auth.enter.u
#coreboard players enable @s tinyauth.auth.enter.i
#coreboard players enable @s tinyauth.auth.enter.o
#coreboard players enable @s tinyauth.auth.enter.p
#coreboard players enable @s tinyauth.auth.enter.a
#coreboard players enable @s tinyauth.auth.enter.s
#coreboard players enable @s tinyauth.auth.enter.d
#coreboard players enable @s tinyauth.auth.enter.f
#coreboard players enable @s tinyauth.auth.enter.g
#coreboard players enable @s tinyauth.auth.enter.h
#coreboard players enable @s tinyauth.auth.enter.j
#coreboard players enable @s tinyauth.auth.enter.k
#coreboard players enable @s tinyauth.auth.enter.l
#coreboard players enable @s tinyauth.auth.enter.z
#coreboard players enable @s tinyauth.auth.enter.x
#coreboard players enable @s tinyauth.auth.enter.c
#coreboard players enable @s tinyauth.auth.enter.v
#coreboard players enable @s tinyauth.auth.enter.b
#coreboard players enable @s tinyauth.auth.enter.n
#coreboard players enable @s tinyauth.auth.enter.m

scoreboard players enable @s tinyauth.auth.enter

scoreboard players enable @s tinyauth.auth.submit
scoreboard players enable @s tinyauth.auth.clear
scoreboard players enable @s tinyauth.auth.login_with_otp
scoreboard players enable @s tinyauth.auth.change_theme
scoreboard players enable @s tinyauth.auth.change_language

scoreboard players enable @s tinyauth.auth.theme.title
scoreboard players enable @s tinyauth.auth.theme.input_title
scoreboard players enable @s tinyauth.auth.theme.input
scoreboard players enable @s tinyauth.auth.theme.default_key
scoreboard players enable @s tinyauth.auth.theme.submit

scoreboard players reset @s tinyauth.auth.control_panel
scoreboard players reset @s tinyauth.auth.create_personal_theme
scoreboard players reset @s tinyauth.auth.change_password
scoreboard players reset @s tinyauth.auth.logout

scoreboard players set @s tinyauth.auth.logged_in 0

$execute unless dimension tiny_auth:authdim run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].active_effects
$execute unless dimension tiny_auth:authdim run data remove storage tiny_auth:storage auths[{UUID:$(UUID)}].attributes
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].active_effects set from entity @s active_effects
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].attributes set from entity @s attributes

attribute @s minecraft:block_break_speed base set 0
attribute @s minecraft:attack_damage base set 0
attribute @s minecraft:movement_speed base set 0
attribute @s minecraft:jump_strength base set 0
attribute @s minecraft:block_interaction_range base set 0
attribute @s minecraft:entity_interaction_range base set 0

effect give @s minecraft:blindness infinite 255 true
effect give @s minecraft:resistance infinite 255 true
effect give @s minecraft:invisibility infinite 255 true

$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].x set from entity @s Pos[0]
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].y set from entity @s Pos[1]
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].z set from entity @s Pos[2]
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].yaw set from entity @s Rotation[0]
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].pitch set from entity @s Rotation[1]
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].dimension set from entity @s Dimension
$execute unless dimension tiny_auth:authdim run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "survival"
$execute unless dimension tiny_auth:authdim if entity @s[gamemode=creative] run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "creative"
$execute unless dimension tiny_auth:authdim if entity @s[gamemode=adventure] run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "adventure"
$execute unless dimension tiny_auth:authdim if entity @s[gamemode=spectator] run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "spectator"
$execute unless dimension tiny_auth:authdim if entity @s[gamemode=survival] run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "survival"

execute in tiny_auth:authdim run tp @s 1000 7 0 -90 -90
gamemode adventure

#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].x run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].x set value 0
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].y run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].y set value 0
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].z run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].z set value 0
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].dimension run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].dimension set value "minecraft:overworld"
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].gamemode set value "survival"
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].active_effects run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].active_effects set value []
#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].attributes run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].attributes set value []

$scoreboard players set @s tinyauth.auth.state $(state)

$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts set from storage tiny_auth:config lock_attempts
$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts set value 5

$execute store result score #lockAttempts tinyauth.auth.temp run data get storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts

$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts set from storage tiny_auth:config max_attempts
$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts set value 3

$execute store result score @s tinyauth.auth.temp run data get storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts

$execute if score @s tinyauth.auth.temp matches ..0 run data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].attempts set from storage tiny_auth:config max_attempts
execute if score @s tinyauth.auth.temp matches ..0 run function tiny_auth:logs/new/with_me {filter:"Lockouts",action:"account_locked",reason:"max_attempts_reached"}
execute if score @s tinyauth.auth.temp matches ..0 run scoreboard players set @s tinyauth.auth.state 3
execute if score @s tinyauth.auth.temp matches ..0 store result score #gametime tinyauth.auth.temp run time query gametime
execute if score @s tinyauth.auth.temp matches ..0 store result score #lockout_duration tinyauth.auth.temp run data get storage tiny_auth:config lockout_duration
$execute if score @s tinyauth.auth.temp matches ..0 store result storage tiny_auth:storage auths[{UUID:$(UUID)}].time int 1 run scoreboard players operation #gametime tinyauth.auth.temp += #lockout_duration tinyauth.auth.temp
execute if score @s tinyauth.auth.temp matches ..0 run scoreboard players remove #lockAttempts tinyauth.auth.temp 1
$execute if score @s tinyauth.auth.temp matches ..0 store result storage tiny_auth:storage auths[{UUID:$(UUID)}].lock_attempts int 1 run scoreboard players get #lockAttempts tinyauth.auth.temp

$data modify storage tiny_auth:temp show_dialog set from storage tiny_auth:storage auths[{UUID:$(UUID)}]

$execute unless score @s tinyauth.auth.temp matches ..0 run data modify storage tiny_auth:temp setMessage.message set value "$(message)"
execute if score @s tinyauth.auth.temp matches ..0 run data modify storage tiny_auth:temp setMessage.message set value "blocked"
execute if score #lockAttempts tinyauth.auth.temp matches ..0 run data modify storage tiny_auth:temp setMessage.message set value "enter_otp"
execute store result storage tiny_auth:temp setMessage.language int 1 run scoreboard players get @s tinyauth.auth.language_id

$execute if data storage tiny_auth:temp {setMessage:{message:"-1"}} run data modify storage tiny_auth:temp setMessage.message set from storage tiny_auth:storage auths[{UUID:$(UUID)}].prevmessage
execute if data storage tiny_auth:temp {setMessage:{message:""}} run data modify storage tiny_auth:temp setMessage.message set value "none"

$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].prevmessage set from storage tiny_auth:temp setMessage.message

data modify storage tiny_auth:temp show_dialog.message set value {"text":""}
function tiny_auth:auth/init/set_message with storage tiny_auth:temp setMessage

$data modify storage tiny_auth:temp show_dialog.submit set value "$(submit)"
execute if data storage tiny_auth:temp {show_dialog:{password:""}} if data storage tiny_auth:temp {show_dialog:{submit:""}} run data modify storage tiny_auth:temp show_dialog.submit set value "Register"
execute unless data storage tiny_auth:temp {show_dialog:{password:""}} if data storage tiny_auth:temp {show_dialog:{submit:""}} run data modify storage tiny_auth:temp show_dialog.submit set value "Log In"

execute unless score @s tinyauth.auth.state matches 6 run data modify storage tiny_auth:temp show_dialog.login_with_otp set value "Login With OTP"
execute if score @s tinyauth.auth.state matches 6 run data modify storage tiny_auth:temp show_dialog.login_with_otp set value "Login With Password"

$execute if data storage tiny_auth:temp {show_dialog:{submit:"-1"}} run data modify storage tiny_auth:temp show_dialog.submit set from storage tiny_auth:storage auths[{UUID:$(UUID)}].prevsubmit

$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].prevsubmit set from storage tiny_auth:temp show_dialog.submit

data modify storage tiny_auth:temp themeSetup.UUID set from entity @s UUID
execute store result storage tiny_auth:temp themeSetup.theme_id int 1 run scoreboard players get @s tinyauth.auth.theme_id
execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:temp themeSetup.theme_id set value -1

function tiny_auth:auth/theme/setup with storage tiny_auth:temp themeSetup

execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:temp show_dialog.message set value [{text:"Title\n",click_event:{action:"run_command",command:"trigger tinyauth.auth.theme.title"}},{text:"Input Title\n",click_event:{action:"run_command",command:"trigger tinyauth.auth.theme.input_title"}},{text:"Input\n",click_event:{action:"run_command",command:"trigger tinyauth.auth.theme.input"}},{text:"Default Key\n",click_event:{action:"run_command",command:"trigger tinyauth.auth.theme.default_key"}},{text:"Submit",click_event:{action:"run_command",command:"trigger tinyauth.auth.theme.submit"}}]
execute if score @s tinyauth.auth.state matches 4 run data modify storage tiny_auth:temp show_dialog.input set value "PASSWORD"

function tiny_auth:auth/show_dialog with storage tiny_auth:temp show_dialog
scoreboard players set @s tinyauth.auth.gui_opened 1
