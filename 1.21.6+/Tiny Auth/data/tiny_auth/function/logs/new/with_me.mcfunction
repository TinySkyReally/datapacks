#{
#  "player": "PlayerName",
#  "uuid": "player-uuid-string",
#  "filter": "Fails", - ["All","Fails","Lockouts","Resets"]
#  "action": "login_failed", 
#  "reason": "wrong_password",
#  "timestamp": 1714500000 
#}

data modify storage tiny_auth:temp logs.new_with_me.UUID set from entity @s UUID
$data modify storage tiny_auth:temp logs.new_with_me.filter set value "$(filter)"
$data modify storage tiny_auth:temp logs.new_with_me.action set value "$(action)"
$data modify storage tiny_auth:temp logs.new_with_me.reason set value "$(reason)"

function tiny_auth:logs/new/with_uuid with storage tiny_auth:temp logs.new_with_me
