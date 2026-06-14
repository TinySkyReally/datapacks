$data modify storage tiny_auth:temp messageSet set from storage tiny_auth:visuals languages[{id:$(language)}]
data modify storage tiny_auth:temp messageSetEnUs set from storage tiny_auth:visuals languages[{name:"en-us"}]

data modify storage tiny_auth:temp show_dialog.language set from storage tiny_auth:temp messageSet.name

data modify storage tiny_auth:temp show_dialog.message set value {"text":""}

$execute if data storage tiny_auth:temp {messageSet:{$(message):{}}} run data modify storage tiny_auth:temp show_dialog.message set from storage tiny_auth:temp messageSet.$(message)

$execute unless data storage tiny_auth:temp {messageSet:{$(message):{}}} if data storage tiny_auth:temp {messageSetEnUs:{$(message):{}}} run data modify storage tiny_auth:temp show_dialog.message set from storage tiny_auth:temp messageSetEnUs.$(message)

$data modify storage tiny_auth:temp messageSetMacro.message set value "$(message)"
execute unless data storage tiny_auth:temp {messageSetMacro:{message:"blocked"}} run return 0

execute store result score #timeLeft tinyauth.auth.temp run data get storage tiny_auth:storage auths[0].time
execute store result score #timeTotal tinyauth.auth.temp run time query gametime

scoreboard players operation #timeLeft tinyauth.auth.temp -= #timeTotal tinyauth.auth.temp
scoreboard players set #l20 tinyauth.auth.temp 20
scoreboard players operation #timeLeft tinyauth.auth.temp /= #l20 tinyauth.auth.temp

execute if score #timeLeft tinyauth.auth.temp matches ..0 run data modify storage tiny_auth:temp show_dialog.message set value {"text":""}
execute if score #timeLeft tinyauth.auth.temp matches ..0 if data storage tiny_auth:temp {messageSet:{unblocked:{}}} run data modify storage tiny_auth:temp show_dialog.message set from storage tiny_auth:temp messageSet.unblocked
execute if score #timeLeft tinyauth.auth.temp matches ..0 unless data storage tiny_auth:temp {messageSet:{unblocked:{}}} if data storage tiny_auth:temp {messageSetEnUs:{unblocked:{}}} run data modify storage tiny_auth:temp show_dialog.message set from storage tiny_auth:temp messageSetEnUs.unblocked
execute if score #timeLeft tinyauth.auth.temp matches ..0 run return 0

data modify storage tiny_auth:temp messageSetMacro.message set from storage tiny_auth:temp show_dialog.message
execute store result storage tiny_auth:temp messageSetMacro.timeLeft int 1 run scoreboard players get #timeLeft tinyauth.auth.temp

function tiny_auth:auth/init/set_message/macro with storage tiny_auth:temp messageSetMacro
