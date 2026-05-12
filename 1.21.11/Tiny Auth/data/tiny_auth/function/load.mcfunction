scoreboard objectives add tinyauth.auth.submit trigger
scoreboard objectives add tinyauth.auth.clear trigger
scoreboard objectives add tinyauth.auth.login_with_otp trigger
scoreboard objectives add tinyauth.auth.change_theme trigger
scoreboard objectives add tinyauth.auth.change_language trigger

scoreboard objectives add tinyauth.auth.theme.title trigger
scoreboard objectives add tinyauth.auth.theme.input_title trigger
scoreboard objectives add tinyauth.auth.theme.input trigger
scoreboard objectives add tinyauth.auth.theme.default_key trigger
scoreboard objectives add tinyauth.auth.theme.submit trigger

scoreboard objectives add tinyauth.auth.enter.1 trigger
scoreboard objectives add tinyauth.auth.enter.2 trigger
scoreboard objectives add tinyauth.auth.enter.3 trigger
scoreboard objectives add tinyauth.auth.enter.4 trigger
scoreboard objectives add tinyauth.auth.enter.5 trigger
scoreboard objectives add tinyauth.auth.enter.6 trigger
scoreboard objectives add tinyauth.auth.enter.7 trigger
scoreboard objectives add tinyauth.auth.enter.8 trigger
scoreboard objectives add tinyauth.auth.enter.9 trigger
scoreboard objectives add tinyauth.auth.enter.0 trigger
scoreboard objectives add tinyauth.auth.enter.q trigger
scoreboard objectives add tinyauth.auth.enter.w trigger
scoreboard objectives add tinyauth.auth.enter.e trigger
scoreboard objectives add tinyauth.auth.enter.r trigger
scoreboard objectives add tinyauth.auth.enter.t trigger
scoreboard objectives add tinyauth.auth.enter.y trigger
scoreboard objectives add tinyauth.auth.enter.u trigger
scoreboard objectives add tinyauth.auth.enter.i trigger
scoreboard objectives add tinyauth.auth.enter.o trigger
scoreboard objectives add tinyauth.auth.enter.p trigger
scoreboard objectives add tinyauth.auth.enter.a trigger
scoreboard objectives add tinyauth.auth.enter.s trigger
scoreboard objectives add tinyauth.auth.enter.d trigger
scoreboard objectives add tinyauth.auth.enter.f trigger
scoreboard objectives add tinyauth.auth.enter.g trigger
scoreboard objectives add tinyauth.auth.enter.h trigger
scoreboard objectives add tinyauth.auth.enter.j trigger
scoreboard objectives add tinyauth.auth.enter.k trigger
scoreboard objectives add tinyauth.auth.enter.l trigger
scoreboard objectives add tinyauth.auth.enter.z trigger
scoreboard objectives add tinyauth.auth.enter.x trigger
scoreboard objectives add tinyauth.auth.enter.c trigger
scoreboard objectives add tinyauth.auth.enter.v trigger
scoreboard objectives add tinyauth.auth.enter.b trigger
scoreboard objectives add tinyauth.auth.enter.n trigger
scoreboard objectives add tinyauth.auth.enter.m trigger

scoreboard objectives add tinyauth.auth.change_password trigger
scoreboard objectives add tinyauth.auth.logout trigger
scoreboard objectives add tinyauth.auth.create_personal_theme trigger

scoreboard objectives add tinyauth.auth.state dummy
scoreboard objectives add tinyauth.auth.temp dummy
scoreboard objectives add tinyauth.auth.theme_id dummy
scoreboard objectives add tinyauth.auth.language_id dummy

scoreboard objectives add tinyauth.detection.leave_game minecraft.custom:minecraft.leave_game

gamerule send_command_feedback false

data modify storage tiny_auth:storage colors set value {BLACK:"black",DARKBLUE:"dark_blue",DARKGREEN:"dark_green",DARKAQUA:"dark_aqua",DARKRED:"dark_red",DARKPURPLE:"dark_purple",GOLD:"gold",GRAY:"gray",DARKGRAY:"dark_gray",BLUE:"blue",GREEN:"green",AQUA:"aqua",RED:"red",LIGHTPURPLE:"light_purple",YELLOW:"yellow",WHITE:"white"}
data modify storage tiny_auth:storage lowercase_map set value {A:"a",B:"b",C:"c",D:"d",E:"e",F:"f",G:"g",H:"h",I:"i",J:"j",K:"k",L:"l",M:"m",N:"n",O:"o",P:"p",Q:"q",R:"r",S:"s",T:"t",U:"u",V:"v",W:"w",X:"x",Y:"y",Z:"z"}
data modify storage tiny_auth:storage character_list set value ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

data remove storage tiny_auth:visuals themes
data remove storage tiny_auth:visuals languages

function tiny_auth:languages
function tiny_auth:themes
function tiny_auth:config

function tiny_auth:config/setup with storage tiny_auth:config
