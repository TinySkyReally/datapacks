$data modify storage tiny_auth:keys auths[{UUID:$(UUID)}].input set value ""

execute if score @s tinyauth.auth.page matches 4 run function tiny_auth:auth/admin/control_gui/action/init_page {page:4}
execute if score @s tinyauth.auth.page matches 5 run function tiny_auth:auth/admin/control_gui/action/init_page {page:5}
