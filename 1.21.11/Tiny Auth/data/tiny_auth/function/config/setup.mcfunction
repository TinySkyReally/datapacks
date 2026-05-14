execute if data storage tiny_auth:config admin.lockout_duration run data modify storage tiny_auth:config lockout_duration set from storage tiny_auth:config admin.lockout_duration
execute if data storage tiny_auth:config admin.max_attempts run data modify storage tiny_auth:config max_attempts set from storage tiny_auth:config admin.max_attempts
execute if data storage tiny_auth:config admin.lock_attempts run data modify storage tiny_auth:config lock_attempts set from storage tiny_auth:config admin.lock_attempts
execute if data storage tiny_auth:config admin.max_password_length run data modify storage tiny_auth:config max_password_length set from storage tiny_auth:config admin.max_password_length
execute if data storage tiny_auth:config admin.default_dimension run data modify storage tiny_auth:config default_dimension set from storage tiny_auth:config admin.default_dimension
execute if data storage tiny_auth:config admin.default_x run data modify storage tiny_auth:config default_x set from storage tiny_auth:config admin.default_x
execute if data storage tiny_auth:config admin.default_y run data modify storage tiny_auth:config default_y set from storage tiny_auth:config admin.default_y
execute if data storage tiny_auth:config admin.default_z run data modify storage tiny_auth:config default_z set from storage tiny_auth:config admin.default_z
execute if data storage tiny_auth:config admin.default_yaw run data modify storage tiny_auth:config default_yaw set from storage tiny_auth:config admin.default_yaw
execute if data storage tiny_auth:config admin.default_pitch run data modify storage tiny_auth:config default_pitch set from storage tiny_auth:config admin.default_pitch
execute if data storage tiny_auth:config admin.default_gamemode run data modify storage tiny_auth:config default_gamemode set from storage tiny_auth:config admin.default_gamemode
execute if data storage tiny_auth:config admin.theme run data modify storage tiny_auth:config theme set from storage tiny_auth:config admin.theme
execute if data storage tiny_auth:config admin.language run data modify storage tiny_auth:config language set from storage tiny_auth:config admin.language

$data modify storage tiny_auth:config theme_id set from storage tiny_auth:visuals themes[{name:"$(theme)"}].id
$data modify storage tiny_auth:config language_id set from storage tiny_auth:visuals languages[{name:"$(language)"}].id
