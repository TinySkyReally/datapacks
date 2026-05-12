$data modify storage tiny_auth:temp cptSet.input set value "$(input)"

$execute unless data storage tiny_auth:temp {cptSet:{input:""}} if data storage tiny_auth:storage colors.$(input) run return run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].CustomTheme.$(key) set from storage tiny_auth:storage colors.$(input)

scoreboard players set #ColorTest tinyauth.auth.temp 0
$execute store result score #ColorTest tinyauth.auth.temp run function tiny_auth:auth/create_personal_theme/test {input:"$(input)"}
$execute if score #ColorTest tinyauth.auth.temp matches 1 run return run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].CustomTheme.$(key) set value "#$(input)"

$data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].CustomTheme.$(key) set value "white"
