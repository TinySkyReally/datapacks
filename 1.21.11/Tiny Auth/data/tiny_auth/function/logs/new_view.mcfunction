#{
#  "player": "PlayerName",
#  "uuid": "player-uuid-string",
#  "filter": "Fails", - ["All","Fails","Lockouts","Resets"]
#  "action": "login_failed", 
#  "reason": "wrong_password",
#  "timestamp": 1714500000 
#}

$data modify storage tiny_auth:storage logs_view append value {"text":"[","color":"gray","extra":[{"text":"$(timestamp)","color":"dark_aqua"},{"text":"] ","color":"gray"},{"text":"$(player)","color":"yellow","bold":true,"hover_event":{"action":"show_text","value":[{"text":"Player: ","color":"gray"},{"text":"$(player)\n","color":"yellow","bold":true},{"text":"UUID: ","color":"gray"},{"text":"$(uuid)","color":"gold"}]}},{"text":" » ","color":"dark_gray"},{"text":"$(action)\n","color":"gold","hover_event":{"action":"show_text","value":[{"text":"Action Log\n","color":"gold","bold":true},{"text":"Type: ","color":"gray"},{"text":"$(action)\n","color":"white"},{"text":"Reason: ","color":"gray"},{"text":"$(reason)","color":"red"}]}}],filter:"$(filter)",player:"$(player)"}

execute store result score #log_view_count tinyauth.auth.temp run data get storage tiny_auth:storage logs_view
execute if score #log_view_count tinyauth.auth.temp matches 51.. run data remove storage tiny_auth:storage logs_view[0]
