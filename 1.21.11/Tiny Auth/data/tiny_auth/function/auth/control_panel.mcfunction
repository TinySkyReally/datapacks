scoreboard players reset @s tinyauth.auth.control_panel
scoreboard players enable @s tinyauth.auth.control_panel

tellraw @s [{"text":"[!] ","color":"gold"},{"text":"Please verify by clicking this button: ","color":"gray"},{"text":"[Verify]","bold":true,"color":"red","click_event":{"action":"run_command","command":"/function tiny_auth:auth/admin/control_gui"},"hover_event":{"action":"show_text","value":"Click to verify!"}}]
