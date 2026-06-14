scoreboard objectives add tinyauth.hash_state dummy
scoreboard objectives add tinyauth.auth.submit trigger
scoreboard objectives add tinyauth.auth.clear trigger
scoreboard objectives add tinyauth.auth.login_with_otp trigger
scoreboard objectives add tinyauth.auth.change_theme trigger
scoreboard objectives add tinyauth.auth.change_language trigger

scoreboard objectives add tinyauth.auth.control_panel.action trigger

scoreboard objectives add tinyauth.auth.theme.title trigger
scoreboard objectives add tinyauth.auth.theme.input_title trigger
scoreboard objectives add tinyauth.auth.theme.input trigger
scoreboard objectives add tinyauth.auth.theme.default_key trigger
scoreboard objectives add tinyauth.auth.theme.submit trigger

scoreboard objectives add tinyauth.auth.enter trigger

#scoreboard objectives add tinyauth.auth.enter.1 trigger
#scoreboard objectives add tinyauth.auth.enter.2 trigger
#scoreboard objectives add tinyauth.auth.enter.3 trigger
#scoreboard objectives add tinyauth.auth.enter.4 trigger
#scoreboard objectives add tinyauth.auth.enter.5 trigger
#scoreboard objectives add tinyauth.auth.enter.6 trigger
#scoreboard objectives add tinyauth.auth.enter.7 trigger
#scoreboard objectives add tinyauth.auth.enter.8 trigger
#scoreboard objectives add tinyauth.auth.enter.9 trigger
#scoreboard objectives add tinyauth.auth.enter.0 trigger
#scoreboard objectives add tinyauth.auth.enter.q trigger
#scoreboard objectives add tinyauth.auth.enter.w trigger
#scoreboard objectives add tinyauth.auth.enter.e trigger
#scoreboard objectives add tinyauth.auth.enter.r trigger
#scoreboard objectives add tinyauth.auth.enter.t trigger
#scoreboard objectives add tinyauth.auth.enter.y trigger
#scoreboard objectives add tinyauth.auth.enter.u trigger
#scoreboard objectives add tinyauth.auth.enter.i trigger
#scoreboard objectives add tinyauth.auth.enter.o trigger
#scoreboard objectives add tinyauth.auth.enter.p trigger
#scoreboard objectives add tinyauth.auth.enter.a trigger
#scoreboard objectives add tinyauth.auth.enter.s trigger
#scoreboard objectives add tinyauth.auth.enter.d trigger
#scoreboard objectives add tinyauth.auth.enter.f trigger
#scoreboard objectives add tinyauth.auth.enter.g trigger
#scoreboard objectives add tinyauth.auth.enter.h trigger
#scoreboard objectives add tinyauth.auth.enter.j trigger
#scoreboard objectives add tinyauth.auth.enter.k trigger
#scoreboard objectives add tinyauth.auth.enter.l trigger
#scoreboard objectives add tinyauth.auth.enter.z trigger
#scoreboard objectives add tinyauth.auth.enter.x trigger
#scoreboard objectives add tinyauth.auth.enter.c trigger
#scoreboard objectives add tinyauth.auth.enter.v trigger
#scoreboard objectives add tinyauth.auth.enter.b trigger
#scoreboard objectives add tinyauth.auth.enter.n trigger
#scoreboard objectives add tinyauth.auth.enter.m trigger

#scoreboard objectives add tinyauth.auth.enter.minus trigger
#scoreboard objectives add tinyauth.auth.enter.dot trigger

scoreboard objectives add tinyauth.auth.change_password trigger
scoreboard objectives add tinyauth.auth.logout trigger
scoreboard objectives add tinyauth.auth.create_personal_theme trigger
scoreboard objectives add tinyauth.auth.control_panel trigger

scoreboard objectives add tinyauth.auth.state dummy
scoreboard objectives add tinyauth.auth.gui_opened dummy
scoreboard objectives add tinyauth.auth.logged_in dummy
scoreboard objectives add tinyauth.auth.page dummy
scoreboard objectives add tinyauth.auth.actionpage dummy
scoreboard objectives add tinyauth.auth.temp dummy
scoreboard objectives add tinyauth.auth.theme_id dummy
scoreboard objectives add tinyauth.auth.language_id dummy
scoreboard objectives add tinyauth.auth.log_limit dummy
scoreboard objectives add tinyauth.auth.log_filter dummy
scoreboard objectives add tinyauth.auth.log_page dummy
scoreboard objectives add tinyauth.auth.log_player dummy
scoreboard objectives add tinyauth.last_seen dummy
scoreboard objectives add tinyauth.session_delta dummy

scoreboard objectives add tinyauth.detection.leave_game minecraft.custom:minecraft.leave_game

gamerule send_command_feedback false

data modify storage tiny_auth:storage colors set value {BLACK:"black",DARKBLUE:"dark_blue",DARKGREEN:"dark_green",DARKAQUA:"dark_aqua",DARKRED:"dark_red",DARKPURPLE:"dark_purple",GOLD:"gold",GRAY:"gray",DARKGRAY:"dark_gray",BLUE:"blue",GREEN:"green",AQUA:"aqua",RED:"red",LIGHTPURPLE:"light_purple",YELLOW:"yellow",WHITE:"white"}
data modify storage tiny_auth:storage lowercase_map set value {A:"a",B:"b",C:"c",D:"d",E:"e",F:"f",G:"g",H:"h",I:"i",J:"j",K:"k",L:"l",M:"m",N:"n",O:"o",P:"p",Q:"q",R:"r",S:"s",T:"t",U:"u",V:"v",W:"w",X:"x",Y:"y",Z:"z"}
data modify storage tiny_auth:storage character_map set value {"1":"0", "2":"1", "3":"2", "4":"3", "5":"4", "6":"5", "7":"6", "8":"7", "9":"8", "10":"9", "11":"A", "12":"B", "13":"C", "14":"D", "15":"E", "16":"F", "17":"G", "18":"H", "19":"I", "20":"J", "21":"K", "22":"L", "23":"M", "24":"N", "25":"O", "26":"P", "27":"Q", "28":"R", "29":"S", "30":"T", "31":"U", "32":"V", "33":"W", "34":"X", "35":"Y", "36":"Z", "37":"-", "38":"_", "39":"!", "40":"?", "41":".", "42":"@", "43":"#"}
data modify storage tiny_auth:storage character_list set value ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","-","_","!","?",".","@", "#"]
data modify storage tiny_auth:storage character_types set value {"0":"Number", "1":"Number", "2":"Number", "3":"Number", "4":"Number", "5":"Number", "6":"Number", "7":"Number", "8":"Number", "9":"Number", "A":"Letter", "B":"Letter", "C":"Letter", "D":"Letter", "E":"Letter", "F":"Letter", "G":"Letter", "H":"Letter", "I":"Letter", "J":"Letter", "K":"Letter", "L":"Letter", "M":"Letter", "N":"Letter", "O":"Letter", "P":"Letter", "Q":"Letter", "R":"Letter", "S":"Letter", "T":"Letter", "U":"Letter", "V":"Letter", "W":"Letter", "X":"Letter", "Y":"Letter", "Z":"Letter", "-":"Symbol", "_":"Symbol", "!":"Symbol", "?":"Symbol", ".":"Symbol", "@":"Symbol", "#":"Symbol" }
data modify storage tiny_auth:storage log_filters set value ["All","Fails","Lockouts","Resets"]

data remove storage tiny_auth:visuals themes
data remove storage tiny_auth:visuals languages

function tiny_auth:languages
function tiny_auth:themes
function tiny_auth:config

function tiny_auth:config/setup with storage tiny_auth:config

function tiny_auth:version
