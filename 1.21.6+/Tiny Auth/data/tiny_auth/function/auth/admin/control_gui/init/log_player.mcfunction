$data modify storage tiny_auth:temp control_panel.log_player set from storage tiny_auth:storage unique_players[$(log_player)].name
$execute if predicate {condition:"minecraft:value_check",value:$(log_player),range:-1} run data modify storage tiny_auth:temp control_panel.log_player set value "All"
