$data modify storage tiny_auth:temp join set value {UUID:$(UUID),message:"",submit:"",state:1}
execute if score @s tinyauth.auth.state matches 3 run data modify storage tiny_auth:temp join.state set value 3
$execute if data storage tiny_auth:storage auths[{UUID:$(UUID)}].new_security_hash_set run data modify storage tiny_auth:temp join.state set value 2
$execute if data storage tiny_auth:storage auths[{UUID:$(UUID)}].new_security_hash_set run data modify storage tiny_auth:temp join.submit set value "Submit - Upgrade to new security."

function tiny_auth:auth/init with storage tiny_auth:temp join
