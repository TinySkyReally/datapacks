$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].input set from storage tiny_auth:config $(id)
$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].admin_id set value $(id)
$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].admin_page set value $(page)
