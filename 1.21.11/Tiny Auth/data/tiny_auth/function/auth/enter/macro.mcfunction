$data modify storage tiny_auth:temp enter.input set from storage tiny_auth:keys auths[{UUID:$(UUID)}].input
$data modify storage tiny_auth:temp enter.textLower set from storage tiny_auth:storage lowercase_map."$(text)"
$data modify storage tiny_auth:temp enter.text set value "$(text)"

function tiny_auth:auth/enter/macro1 with storage tiny_auth:temp enter
