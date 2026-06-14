$data modify storage tiny_auth:temp OTP.char set from storage tiny_auth:storage character_list[$(random)]
function tiny_auth:auth/generate_otp/add_char/macro1 with storage tiny_auth:temp OTP


$scoreboard players set #current_char_id tinyauth.auth.temp $(random)

scoreboard players set #multiplier tinyauth.auth.temp 33
scoreboard players operation @s tinyauth.hash_state *= #multiplier tinyauth.auth.temp
scoreboard players operation @s tinyauth.hash_state += #current_char_id tinyauth.auth.temp

scoreboard players set #alphabet_size tinyauth.auth.temp 43
scoreboard players operation @s tinyauth.hash_state %= #alphabet_size tinyauth.auth.temp

execute store result storage tiny_auth:temp OTP.scrambled_id int 1 run scoreboard players get @s tinyauth.hash_state

function tiny_auth:auth/generate_otp/add_char/macro2 with storage tiny_auth:temp OTP

