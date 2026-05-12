$data modify storage tiny_auth:temp auth set from storage tiny_auth:keys auths[{UUID:$(UUID)}]

$execute unless data storage tiny_auth:temp {auth:{password:"$(input)"}} run return run data modify storage tiny_auth:temp auth.test set value 1b

#$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:keys auths append value {UUID:$(UUID),password:"",input:""}
