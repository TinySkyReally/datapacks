data modify storage tiny_auth:storage unique_players set value []
data modify storage tiny_auth:temp control_panel.scan set from storage tiny_auth:storage logs

execute if data storage tiny_auth:temp control_panel.scan[0] run function tiny_auth:logs/sync_players_loop with storage tiny_auth:temp control_panel
