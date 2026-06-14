data remove storage tiny_auth:temp change_language.language
$data modify storage tiny_auth:temp change_language.language set from storage tiny_auth:visuals languages[{id:$(language_id)}]

execute unless data storage tiny_auth:temp {change_language:{language:{}}} run scoreboard players set @s tinyauth.auth.language_id 0

$data modify storage tiny_auth:temp initLanguage set value {UUID:$(UUID),message:-1,submit:-1,state:1}
execute store result storage tiny_auth:temp initLanguage.state int 1 run scoreboard players get @s tinyauth.auth.state

function tiny_auth:auth/init with storage tiny_auth:temp initLanguage
