data modify storage tiny_auth:temp control_panel.payload set value {}
data modify storage tiny_auth:temp control_panel.payload.player set from storage tiny_auth:temp control_panel.scan[0].player

function tiny_auth:logs/sync_players_loop/macro with storage tiny_auth:temp control_panel.payload

data remove storage tiny_auth:temp control_panel.scan[0]
execute if data storage tiny_auth:temp control_panel.scan[0] run function tiny_auth:logs/sync_players_loop with storage tiny_auth:temp control_panel
