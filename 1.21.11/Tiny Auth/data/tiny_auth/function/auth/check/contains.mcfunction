#remaining, UUID
data modify storage tiny_auth:temp PasswordContainsLoop.loopitem set string storage tiny_auth:temp PasswordContainsLoop.remaining 0 1

data remove storage tiny_auth:temp PasswordContainsLoop.chartype
function tiny_auth:auth/check/contains/macro with storage tiny_auth:temp PasswordContainsLoop

$execute if data storage tiny_auth:temp PasswordContainsLoop.chartype if data storage tiny_auth:temp {PasswordContainsLoop:{chartype:"Number"}} run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].input_contains_number set value 1b
$execute if data storage tiny_auth:temp PasswordContainsLoop.chartype if data storage tiny_auth:temp {PasswordContainsLoop:{chartype:"Letter"}} run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].input_contains_letter set value 1b
$execute if data storage tiny_auth:temp PasswordContainsLoop.chartype if data storage tiny_auth:temp {PasswordContainsLoop:{chartype:"Symbol"}} run data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].input_contains_symbol set value 1b

data modify storage tiny_auth:temp PasswordContainsLoop.remaining set string storage tiny_auth:temp PasswordContainsLoop.remaining 1

execute store result score #length tinyauth.auth.temp run data get storage tiny_auth:temp PasswordContainsLoop.remaining
execute if score #length tinyauth.auth.temp matches 1.. run function tiny_auth:auth/check/contains with storage tiny_auth:temp PasswordContainsLoop
