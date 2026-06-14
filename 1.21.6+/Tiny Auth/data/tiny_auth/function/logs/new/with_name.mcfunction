#{
#  "player": "PlayerName",
#  "uuid": "player-uuid-string",
#  "filter": "Fails", - ["All","Fails","Lockouts","Resets"]
#  "action": "login_failed", 
#  "reason": "wrong_password",
#  "timestamp": 1714500000 
#}

data modify storage tiny_auth:temp logs.new_with_name set value {player:"",uuid:"",action:"",reason:"",timestamp:""}

$data modify storage tiny_auth:temp logs.new_with_name.player set value "$(Name)"
$data modify storage tiny_auth:temp logs.new_with_name.uuid set from storage tiny_auth:storage auths[{Name:"$(Name)"}].UUID
$data modify storage tiny_auth:temp logs.new_with_name.filter set value "$(filter)"
$data modify storage tiny_auth:temp logs.new_with_name.action set value "$(action)"
$data modify storage tiny_auth:temp logs.new_with_name.reason set value "$(reason)"

function tiny_auth:logs/new with storage tiny_auth:temp logs.new_with_name
