scoreboard players reset @s tinyauth.auth.control_panel
scoreboard players enable @s tinyauth.auth.control_panel

execute if score @s tinyauth.auth.gui_opened matches 1 run return run tellraw @s [{text:"You cannot use this command right now!",color:"red"}]

tellraw @s [{"text":"[!] ","color":"gold"},{"text":"Please verify by clicking this button: ","color":"gray"},{"text":"[Verify]","bold":true,"color":"red","click_event":{"action":"run_command","command":"/function tiny_auth:auth/admin/control_gui"},"hover_event":{"action":"show_text","value":"Click to verify!"}}]
