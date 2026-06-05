execute if score @s tinyauth.auth.page matches 4..5 run scoreboard players set #testnumber tinyauth.auth.temp 0
$execute if score @s tinyauth.auth.page matches 4..5 store result score #testnumber tinyauth.auth.temp run function tiny_auth:auth/enter/macro2 with storage tiny_auth:storage auths[{UUID:$(UUID)}]
execute if score @s tinyauth.auth.page matches 4 if score #testnumber tinyauth.auth.temp matches 0 run return run function tiny_auth:auth/admin/control_gui/action/init_page {page:4}
execute if score @s tinyauth.auth.page matches 5 if score #testnumber tinyauth.auth.temp matches 0 run return run function tiny_auth:auth/admin/control_gui/action/init_page {page:5}
$execute if score @s tinyauth.auth.page matches 4..5 unless score #testnumber tinyauth.auth.temp matches 0 run return run function tiny_auth:auth/admin/control_gui/action/submit/macro with storage tiny_auth:storage auths[{UUID:$(UUID)}]
