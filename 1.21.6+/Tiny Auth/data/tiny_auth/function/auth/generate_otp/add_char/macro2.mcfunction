$data modify storage tiny_auth:temp OTP.text_hash set from storage tiny_auth:storage character_map."$(scrambled_id)"

function tiny_auth:auth/generate_otp/add_char/macro3 with storage tiny_auth:temp OTP
