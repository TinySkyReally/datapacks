$return run function tiny_auth:auth/check/test/macro1 with storage tiny_auth:keys auths[{UUID:$(UUID)}]

#$execute unless data storage tiny_auth:keys auths[{UUID:$(UUID)}] run data modify storage tiny_auth:keys auths append value {UUID:$(UUID),password:"",input:""}
