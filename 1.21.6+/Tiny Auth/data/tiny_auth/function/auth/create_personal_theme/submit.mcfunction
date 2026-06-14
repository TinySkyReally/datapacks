$data modify storage tiny_auth:temp submit_theme set value {key:"$(key)",UUID:$(UUID)}
$data modify storage tiny_auth:temp submit_theme.input set from storage tiny_auth:storage auths[{UUID:$(UUID)}].input

function tiny_auth:auth/create_personal_theme/submit/macro with storage tiny_auth:temp submit_theme

data modify storage tiny_auth:temp init.UUID set from entity @s UUID
data modify storage tiny_auth:temp init.message set value ""
data modify storage tiny_auth:temp init.submit set value ""
data modify storage tiny_auth:temp init.state set value 4

function tiny_auth:auth/reset_input with entity @s

function tiny_auth:auth/init with storage tiny_auth:temp init
