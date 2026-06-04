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

#scoreboard players enable @s tinyauth.auth.enter.minus
#scoreboard players enable @s tinyauth.auth.enter.dot

scoreboard players enable @s tinyauth.auth.enter

scoreboard players enable @s tinyauth.auth.submit
scoreboard players enable @s tinyauth.auth.clear

scoreboard players enable @s tinyauth.auth.control_panel.action

scoreboard players reset @s tinyauth.auth.control_panel
scoreboard players reset @s tinyauth.auth.create_personal_theme
scoreboard players reset @s tinyauth.auth.change_password
scoreboard players reset @s tinyauth.auth.logout

scoreboard players set @s tinyauth.auth.state 7
$scoreboard players set @s tinyauth.auth.page $(page)

$execute if score @s tinyauth.auth.page matches -1 store result score @s tinyauth.auth.page run data get storage tiny_auth:keys auths[{UUID:$(UUID)}].prevpage

$execute store result storage tiny_auth:keys auths[{UUID:$(UUID)}].prevpage int 1 run scoreboard players get @s tinyauth.auth.page

#execute if score @s tinyauth.auth.page matches 2 run function tiny_auth:config/setup/config_info

#control_panel.input_info == {id:"name", type:"int", label:"Name"}
execute if data storage tiny_auth:temp control_panel.input_info run data modify storage tiny_auth:temp control_panel_input set from storage tiny_auth:temp control_panel.input_info
execute if data storage tiny_auth:temp control_panel.input_info run data remove storage tiny_auth:temp control_panel.input_info
execute unless data storage tiny_auth:temp control_panel.input_info run data modify storage tiny_auth:temp control_panel_input set value {id:"",type:"string",label:""}
$data modify storage tiny_auth:temp control_panel set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

data modify storage tiny_auth:temp control_panel.input_id set from storage tiny_auth:temp control_panel_input.id
data modify storage tiny_auth:temp control_panel.input_type set from storage tiny_auth:temp control_panel_input.type
data modify storage tiny_auth:temp control_panel.input_label set from storage tiny_auth:temp control_panel_input.label

data modify storage tiny_auth:temp control_panel.config_info set from storage tiny_auth:storage config_info
execute store result storage tiny_auth:temp control_panel.config_max int 1 run data get storage tiny_auth:storage config_info
execute store result score #config_max tinyauth.auth.temp run data get storage tiny_auth:storage config_info
scoreboard players add #config_max tinyauth.auth.temp 1
execute store result storage tiny_auth:temp control_panel.config_max_1 int 1 run scoreboard players get #config_max tinyauth.auth.temp

data modify storage tiny_auth:temp control_panel.logs set from storage tiny_auth:storage logs_view
execute unless score @s tinyauth.auth.log_limit matches 1.. run scoreboard players set @s tinyauth.auth.log_limit 10
execute unless score @s tinyauth.auth.log_filter matches 0.. run scoreboard players set @s tinyauth.auth.log_limit 0
execute unless score @s tinyauth.auth.log_page matches 0.. run scoreboard players set @s tinyauth.auth.log_page 0
execute unless score @s tinyauth.auth.log_player matches -1.. run scoreboard players set @s tinyauth.auth.log_player -1
execute store result storage tiny_auth:temp control_panel.log_limit int 1 run scoreboard players get @s tinyauth.auth.log_limit
execute store result storage tiny_auth:temp control_panel.log_filter int 1 run scoreboard players get @s tinyauth.auth.log_filter
execute store result storage tiny_auth:temp control_panel.log_page int 1 run scoreboard players get @s tinyauth.auth.log_page
execute store result storage tiny_auth:temp control_panel.log_player int 1 run scoreboard players get @s tinyauth.auth.log_player
function tiny_auth:auth/admin/control_gui/init/log_filter with storage tiny_auth:temp control_panel
function tiny_auth:auth/admin/control_gui/init/log_player with storage tiny_auth:temp control_panel
function tiny_auth:auth/admin/control_gui/init/log_view_setup with storage tiny_auth:temp control_panel

execute unless data storage tiny_auth:temp initEnter.numpadColor run data modify storage tiny_auth:temp control_panel.numpadColor set value "green"

execute if data storage tiny_auth:temp initEnter.numpadColor run data modify storage tiny_auth:temp control_panel.numpadColor set from storage tiny_auth:temp initEnter.numpadColor
execute if data storage tiny_auth:temp initEnter.numpadColor run data remove storage tiny_auth:temp initEnter.numpadColor

function tiny_auth:auth/admin/control_gui/setup_page with storage tiny_auth:temp control_panel

function tiny_auth:auth/admin/control_gui/show_dialog with storage tiny_auth:temp control_panel

scoreboard players set @s tinyauth.auth.gui_opened 1
