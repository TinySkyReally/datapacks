#{
#  "player": "PlayerName",
#  "uuid": "player-uuid-string",
#  "filter": "Fails", - ["All","Fails","Lockouts","Resets"]
#  "action": "login_failed",
#  "reason": "wrong_password",
#  "timestamp": 1714500000 
#}

data modify storage tiny_auth:storage logs append value {player:"",uuid:"",action:"",reason:"",timestamp:""}

$data modify storage tiny_auth:storage logs[-1].player set value "$(player)"
$data modify storage tiny_auth:storage logs[-1].uuid set value "$(uuid)"
$data modify storage tiny_auth:storage logs[-1].filter set value "$(filter)"
$data modify storage tiny_auth:storage logs[-1].action set value "$(action)"
$data modify storage tiny_auth:storage logs[-1].reason set value "$(reason)"
execute store result storage tiny_auth:storage logs[-1].timestamp int 1 run time query gametime

execute store result score #log_count tinyauth.auth.temp run data get storage tiny_auth:storage logs
execute if score #log_count tinyauth.auth.temp matches 51.. run data remove storage tiny_auth:storage logs[0]

function tiny_auth:logs/new_view with storage tiny_auth:storage logs[-1]
function tiny_auth:logs/setup_player_list with storage tiny_auth:storage logs[-1]
