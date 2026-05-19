#tiny_auth:datapack version

execute unless data storage tiny_auth:datapack version run function tiny_auth:version/fresh_install

execute if data storage tiny_auth:datapack version unless data storage tiny_auth:datapack {version:"1.2.3"} run function tiny_auth:version/migrate

execute if data storage tiny_auth:datapack {version:"1.2.3"} run tellraw @a [{"text":"[TinyAuth]: ","color":"#557799"},{"text":"Datapack is running on the latest version (v1.2.3)!","color":"#556699"}]
