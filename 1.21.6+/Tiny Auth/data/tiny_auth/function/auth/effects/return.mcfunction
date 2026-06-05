$data modify storage tiny_auth:temp returnEffects.Duration set value $(duration)
$execute unless data storage tiny_auth:temp {returnEffects:{Duration:-1b}} run scoreboard players set #Duration tinyauth.auth.temp $(duration)
execute unless data storage tiny_auth:temp {returnEffects:{Duration:-1b}} run scoreboard players set #l20 tinyauth.auth.temp 20
execute unless data storage tiny_auth:temp {returnEffects:{Duration:-1b}} run scoreboard players operation #Duration tinyauth.auth.temp /= #l20 tinyauth.auth.temp
execute unless data storage tiny_auth:temp {returnEffects:{Duration:-1b}} store result storage tiny_auth:temp returnEffects.Duration int 1 run scoreboard players get #Duration tinyauth.auth.temp
execute if data storage tiny_auth:temp {returnEffects:{Duration:-1b}} run data modify storage tiny_auth:temp returnEffects.Duration set value "infinite"
execute if data storage tiny_auth:temp {returnEffects:{Duration:-1}} run data modify storage tiny_auth:temp returnEffects.Duration set value "infinite"

$data modify storage tiny_auth:temp returnEffects.Amplifier set value $(amplifier)
execute if data storage tiny_auth:temp {returnEffects:{Amplifier:-1b}} run data modify storage tiny_auth:temp returnEffects.Amplifier set value "255"
execute if data storage tiny_auth:temp {returnEffects:{Amplifier:-1}} run data modify storage tiny_auth:temp returnEffects.Amplifier set value "255"

$data modify storage tiny_auth:temp returnEffects.Id set value "$(id)"

data modify storage tiny_auth:temp returnEffects.UUID set from entity @s UUID
function tiny_auth:auth/effects/return/macro1 with storage tiny_auth:temp returnEffects
execute if data storage tiny_auth:temp {returnEffects:{HideParticles:1b}} run data modify storage tiny_auth:temp returnEffects.HideParticles set value "false"
execute if data storage tiny_auth:temp {returnEffects:{HideParticles:0b}} run data modify storage tiny_auth:temp returnEffects.HideParticles set value "true"

function tiny_auth:auth/effects/return/macro with storage tiny_auth:temp returnEffects
