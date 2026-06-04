execute store result score @s tinyauth.auth.temp run data get storage tiny_auth:config max_attempts
$execute store result score @s tinyauth.auth.temp run data get storage tiny_auth:keys auths[{UUID:$(UUID)}].attempts
scoreboard players remove @s tinyauth.auth.temp 1
$execute store result storage tiny_auth:keys auths[{UUID:$(UUID)}].attempts int 1 run scoreboard players get @s tinyauth.auth.temp

$function tiny_auth:auth/init {UUID:$(UUID),message:"wrong",submit:"",state:1}

function tiny_auth:logs/new/with_me {filter:"Fails",action:"login_failed",reason:"incorrect_password"}
