$data modify storage tiny_auth:temp auth set from storage tiny_auth:storage auths[{UUID:$(UUID)}]

$execute unless data storage tiny_auth:temp {auth:{otp:"$(input)"}} run return run data modify storage tiny_auth:temp auth.test set value 1b
