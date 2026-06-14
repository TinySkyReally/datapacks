execute in tiny_auth:authdim positioned 1000 7 0 run forceload add 1000 0 1000 0
execute in tiny_auth:authdim positioned 1000 7 0 run fill ~-1 ~-1 ~-1 ~2 ~2 ~2 minecraft:barrier hollow
execute in tiny_auth:authdim positioned 1000 7 0 run setblock 1000 0 0 minecraft:barrel

#execute in tiny_auth:authdim positioned 0 0 0 run forceload add 0 0 0 0
#execute in tiny_auth:authdim positioned 0 0 0 run setblock 0 0 0 minecraft:barrel

execute store result score #current_tick tinyauth.auth.temp run time query gametime

execute as @a at @s run function tiny_auth:tick/player with entity @s
