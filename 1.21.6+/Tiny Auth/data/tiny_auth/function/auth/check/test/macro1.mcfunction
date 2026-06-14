$data modify storage tiny_auth:temp auth set from storage tiny_auth:storage auths[{UUID:$(UUID)}]

$execute unless data storage tiny_auth:temp {auth:{password:"$(input_hash)"}} run return run data modify storage tiny_auth:temp auth.test set value 1b

#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}] run data modify storage tiny_auth:storage auths append value {UUID:$(UUID),password:"",input:""}
