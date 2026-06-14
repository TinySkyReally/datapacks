execute store result storage tiny_auth:temp OTP.random int 1 run random value 0..35
function tiny_auth:auth/generate_otp/add_char/macro with storage tiny_auth:temp OTP
