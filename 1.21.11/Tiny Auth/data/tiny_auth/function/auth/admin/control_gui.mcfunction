execute unless entity @s[name="TinySkyReally"] run return run tellraw @s [{"text":"This feature is still in progress..","color":"red"}]

data modify storage tiny_auth:temp control_guiInit set value {page:1}
data modify storage tiny_auth:temp control_guiInit.UUID set from entity @s UUID

function tiny_auth:auth/admin/control_gui/init with storage tiny_auth:temp control_guiInit
