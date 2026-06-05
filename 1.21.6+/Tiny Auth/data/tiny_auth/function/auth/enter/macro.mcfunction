$data modify storage tiny_auth:temp enter.input set from storage tiny_auth:storage auths[{UUID:$(UUID)}].input
$data modify storage tiny_auth:temp enter.input_hash set from storage tiny_auth:storage auths[{UUID:$(UUID)}].input_hash
$data modify storage tiny_auth:temp enter.textLower set from storage tiny_auth:storage lowercase_map."$(text)"
$data modify storage tiny_auth:temp enter.text set value "$(text)"
$data modify storage tiny_auth:temp enter.text_hash set value "$(text_hash)"

function tiny_auth:auth/enter/macro1 with storage tiny_auth:temp enter
