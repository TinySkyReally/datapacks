$data modify storage tiny_auth:temp init_page.page set value $(page)
data modify storage tiny_auth:temp init_page.UUID set from entity @s UUID

function tiny_auth:auth/admin/control_gui/init with storage tiny_auth:temp init_page
