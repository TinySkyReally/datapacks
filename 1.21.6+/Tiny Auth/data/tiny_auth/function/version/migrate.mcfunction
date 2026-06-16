function tiny_auth:debug/send_info/with_all {info:{"text":"Updating codebase to v1.2.8. Purging legacy performance hogs...","color":"yellow"}}

# Features
execute if data storage tiny_auth:datapack {version:"1.2.3"} run function tiny_auth:version/migrate/1/2/3
execute unless data storage tiny_auth:storage auths run function tiny_auth:version/migrate/1/2/5
execute unless data storage tiny_auth:datapack {version:"1.2.6"} unless data storage tiny_auth:datapack {version:"1.2.7"} run function tiny_auth:version/migrate/1/2/6

data modify storage tiny_auth:datapack version set value [1,2,8]
