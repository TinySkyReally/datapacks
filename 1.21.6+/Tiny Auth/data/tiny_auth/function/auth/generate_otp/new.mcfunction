function tiny_auth:auth/generate_otp
$data modify storage tiny_auth:storage auths[{UUID:$(UUID)}].otp set from storage tiny_auth:temp OTP.code
function tiny_auth:auth/generate_otp/new/macro with storage tiny_auth:temp OTP
data remove storage tiny_auth:temp OTP.code_raw
