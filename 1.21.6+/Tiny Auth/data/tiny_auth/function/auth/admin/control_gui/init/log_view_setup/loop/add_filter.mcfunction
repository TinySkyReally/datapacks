$execute unless data storage tiny_auth:temp {control_panel:{log_filter:"All"}} unless data storage tiny_auth:temp {control_panel:{loopitem:{filter:"$(log_filter)"}}} run return 0
$execute unless data storage tiny_auth:temp {control_panel:{log_player:"All"}} unless data storage tiny_auth:temp {control_panel:{loopitem:{player:"$(log_player)"}}} run return 0

data modify storage tiny_auth:temp control_panel.logs_view append from storage tiny_auth:temp control_panel.loopitem
