$data modify storage tiny_auth:temp OTP.char set from storage tiny_auth:storage character_list[$(random)]
function tiny_auth:auth/generate_otp/add_char/macro1 with storage tiny_auth:temp OTP
