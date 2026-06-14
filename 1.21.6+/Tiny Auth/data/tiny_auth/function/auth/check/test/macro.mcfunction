$return run function tiny_auth:auth/check/test/macro1 with storage tiny_auth:storage auths[{UUID:$(UUID)}]

#$execute unless data storage tiny_auth:storage auths[{UUID:$(UUID)}] run data modify storage tiny_auth:storage auths append value {UUID:$(UUID),password:"",input:""}
