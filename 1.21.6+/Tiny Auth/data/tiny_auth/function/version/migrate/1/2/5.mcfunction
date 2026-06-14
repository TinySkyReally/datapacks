data modify storage tiny_auth:storage auths set from storage tiny_auth:keys auths
data remove storage tiny_auth:keys auths

data modify storage tiny_auth:storage auths[].new_security_hash_set set value 1b
