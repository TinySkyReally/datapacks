$scoreboard players reset @s tinyauth.auth.enter.$(key)

data modify storage tiny_auth:temp enter.UUID set from entity @s UUID
$data modify storage tiny_auth:temp enter.key set value "$(key)"
$data modify storage tiny_auth:temp enter.text set value "$(text)"

function tiny_auth:auth/enter/macro with storage tiny_auth:temp enter
