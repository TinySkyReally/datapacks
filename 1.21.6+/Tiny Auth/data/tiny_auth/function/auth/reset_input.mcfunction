$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].input set value ""
$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].input_hash set value ""
scoreboard players set @s tinyauth.hash_state 5381