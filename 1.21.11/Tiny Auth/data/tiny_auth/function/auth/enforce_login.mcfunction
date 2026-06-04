$data modify storage tiny_auth:temp join set value {UUID:$(UUID),message:"",submit:"",state:1}
execute if score @s tinyauth.auth.state matches 3 run data modify storage tiny_auth:temp join.state set value 3

function tiny_auth:auth/init with storage tiny_auth:temp join
