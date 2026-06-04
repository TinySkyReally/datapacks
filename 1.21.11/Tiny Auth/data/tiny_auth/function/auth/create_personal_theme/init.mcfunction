#scoreboard players enable @s tinyauth.auth.enter.1
#scoreboard players enable @s tinyauth.auth.enter.2
#scoreboard players enable @s tinyauth.auth.enter.3
#scoreboard players enable @s tinyauth.auth.enter.4
#scoreboard players enable @s tinyauth.auth.enter.5
#scoreboard players enable @s tinyauth.auth.enter.6
#scoreboard players enable @s tinyauth.auth.enter.7
#scoreboard players enable @s tinyauth.auth.enter.8
#scoreboard players enable @s tinyauth.auth.enter.9
#scoreboard players enable @s tinyauth.auth.enter.0
#scoreboard players enable @s tinyauth.auth.enter.q
#scoreboard players enable @s tinyauth.auth.enter.w
#scoreboard players enable @s tinyauth.auth.enter.e
#scoreboard players enable @s tinyauth.auth.enter.r
#scoreboard players enable @s tinyauth.auth.enter.t
#scoreboard players enable @s tinyauth.auth.enter.y
#scoreboard players enable @s tinyauth.auth.enter.u
#scoreboard players enable @s tinyauth.auth.enter.i
#scoreboard players enable @s tinyauth.auth.enter.o
#scoreboard players enable @s tinyauth.auth.enter.p
#scoreboard players enable @s tinyauth.auth.enter.a
#scoreboard players enable @s tinyauth.auth.enter.s
#scoreboard players enable @s tinyauth.auth.enter.d
#scoreboard players enable @s tinyauth.auth.enter.f
#scoreboard players enable @s tinyauth.auth.enter.g
#scoreboard players enable @s tinyauth.auth.enter.h
#scoreboard players enable @s tinyauth.auth.enter.j
#scoreboard players enable @s tinyauth.auth.enter.k
#scoreboard players enable @s tinyauth.auth.enter.l
#scoreboard players enable @s tinyauth.auth.enter.z
#scoreboard players enable @s tinyauth.auth.enter.x
#scoreboard players enable @s tinyauth.auth.enter.c
#scoreboard players enable @s tinyauth.auth.enter.v
#scoreboard players enable @s tinyauth.auth.enter.b
#scoreboard players enable @s tinyauth.auth.enter.n
#scoreboard players enable @s tinyauth.auth.enter.m

scoreboard players enable @s tinyauth.auth.enter

scoreboard players enable @s tinyauth.auth.submit
scoreboard players enable @s tinyauth.auth.clear

scoreboard players reset @s tinyauth.auth.control_panel
scoreboard players reset @s tinyauth.auth.create_personal_theme
scoreboard players reset @s tinyauth.auth.change_password
scoreboard players reset @s tinyauth.auth.logout

scoreboard players set @s tinyauth.auth.state 5

$data modify storage tiny_auth:temp show_editor_dialog set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

data modify storage tiny_auth:temp show_editor_dialog.submit set value "Apply"

data modify storage tiny_auth:temp show_editor_dialog.Color set value "white"
function tiny_auth:auth/create_personal_theme/color_set with storage tiny_auth:temp show_editor_dialog

function tiny_auth:auth/create_personal_theme/show_dialog with storage tiny_auth:temp show_editor_dialog

scoreboard players set @s tinyauth.auth.gui_opened 1
