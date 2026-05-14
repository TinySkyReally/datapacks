scoreboard players enable @s tinyauth.auth.enter.1
scoreboard players enable @s tinyauth.auth.enter.2
scoreboard players enable @s tinyauth.auth.enter.3
scoreboard players enable @s tinyauth.auth.enter.4
scoreboard players enable @s tinyauth.auth.enter.5
scoreboard players enable @s tinyauth.auth.enter.6
scoreboard players enable @s tinyauth.auth.enter.7
scoreboard players enable @s tinyauth.auth.enter.8
scoreboard players enable @s tinyauth.auth.enter.9
scoreboard players enable @s tinyauth.auth.enter.0
scoreboard players enable @s tinyauth.auth.enter.q
scoreboard players enable @s tinyauth.auth.enter.w
scoreboard players enable @s tinyauth.auth.enter.e
scoreboard players enable @s tinyauth.auth.enter.r
scoreboard players enable @s tinyauth.auth.enter.t
scoreboard players enable @s tinyauth.auth.enter.y
scoreboard players enable @s tinyauth.auth.enter.u
scoreboard players enable @s tinyauth.auth.enter.i
scoreboard players enable @s tinyauth.auth.enter.o
scoreboard players enable @s tinyauth.auth.enter.p
scoreboard players enable @s tinyauth.auth.enter.a
scoreboard players enable @s tinyauth.auth.enter.s
scoreboard players enable @s tinyauth.auth.enter.d
scoreboard players enable @s tinyauth.auth.enter.f
scoreboard players enable @s tinyauth.auth.enter.g
scoreboard players enable @s tinyauth.auth.enter.h
scoreboard players enable @s tinyauth.auth.enter.j
scoreboard players enable @s tinyauth.auth.enter.k
scoreboard players enable @s tinyauth.auth.enter.l
scoreboard players enable @s tinyauth.auth.enter.z
scoreboard players enable @s tinyauth.auth.enter.x
scoreboard players enable @s tinyauth.auth.enter.c
scoreboard players enable @s tinyauth.auth.enter.v
scoreboard players enable @s tinyauth.auth.enter.b
scoreboard players enable @s tinyauth.auth.enter.n
scoreboard players enable @s tinyauth.auth.enter.m

scoreboard players enable @s tinyauth.auth.submit
scoreboard players enable @s tinyauth.auth.clear

scoreboard players set @s tinyauth.auth.state 7
$scoreboard players set @s tinyauth.auth.page $(page)

$execute if score @s tinyauth.auth.page matches -1 store result score @s tinyauth.auth.page run data get storage tiny_auth:keys auths[{UUID:$(UUID)}].prevpage

$execute store result storage tiny_auth:keys auths[{UUID:$(UUID)}].prevpage int 1 run scoreboard players get @s tinyauth.auth.page

$data modify storage tiny_auth:temp control_panel set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

function tiny_auth:auth/admin/control_gui/setup_page with storage tiny_auth:temp control_panel

function tiny_auth:auth/admin/control_gui/show_dialog with storage tiny_auth:temp control_panel
