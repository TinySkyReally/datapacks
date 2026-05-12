execute as @a at @s run function tiny_auth:tick/player with entity @s

execute in tiny_auth:authdim positioned 1000 7 0 run forceload add ~ ~ ~ ~
execute in tiny_auth:authdim positioned 1000 7 0 run fill ~-1 ~-1 ~-1 ~2 ~2 ~2 minecraft:barrier hollow

execute in tiny_auth:authdim run forceload add ~ ~ ~ ~
execute in tiny_auth:authdim run setblock 0 0 0 minecraft:barrel
