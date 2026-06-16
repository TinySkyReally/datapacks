#tiny_auth:datapack version

execute unless data storage tiny_auth:datapack version run function tiny_auth:version/fresh_install

execute if data storage tiny_auth:datapack version unless data storage tiny_auth:datapack {version:[1,2,8]} run function tiny_auth:version/migrate

execute if data storage tiny_auth:datapack {version:[1,2,8]} run function tiny_auth:debug/send_info/with_all {info:{"text":"Datapack is running on the latest version (v1.2.8)!","color":"#556699"}}
