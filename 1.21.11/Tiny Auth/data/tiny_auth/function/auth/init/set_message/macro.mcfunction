$data modify storage tiny_auth:temp show_dialog.message set value [$(message),{"text":"$(timeLeft)s."}]
execute if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{periodic_tick:20}} run playsound minecraft:block.note_block.hat ui @s ~ ~ ~ 100 1
