data remove storage tiny_auth:temp change_theme.theme
$data modify storage tiny_auth:temp change_theme.theme set from storage tiny_auth:visuals themes[{id:$(theme_id)}]

execute unless data storage tiny_auth:temp {change_theme:{theme:{}}} run scoreboard players set @s tinyauth.auth.theme_id -1

$data modify storage tiny_auth:temp initTheme set value {UUID:$(UUID),message:-1,submit:-1,state:1}
execute store result storage tiny_auth:temp initTheme.state int 1 run scoreboard players get @s tinyauth.auth.state

function tiny_auth:auth/init with storage tiny_auth:temp initTheme
