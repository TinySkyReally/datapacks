#{
#  "player": "PlayerName",
#  "uuid": "player-uuid-string",
#  "filter": "Fails", - ["All","Fails","Lockouts","Resets"]
#  "action": "login_failed", 
#  "reason": "wrong_password",
#  "timestamp": 1714500000 
#}

data modify storage tiny_auth:temp logs.new_with_uuid set value {player:"",uuid:"",action:"",reason:"",timestamp:""}

$data modify storage tiny_auth:temp logs.new_with_uuid.player set from storage tiny_auth:storage auths[{UUID:$(UUID)}].Name
$data modify storage tiny_auth:temp logs.new_with_uuid.uuid set value "$(UUID)"
$data modify storage tiny_auth:temp logs.new_with_uuid.filter set value "$(filter)"
$data modify storage tiny_auth:temp logs.new_with_uuid.action set value "$(action)"
$data modify storage tiny_auth:temp logs.new_with_uuid.reason set value "$(reason)"

function tiny_auth:logs/new with storage tiny_auth:temp logs.new_with_uuid
