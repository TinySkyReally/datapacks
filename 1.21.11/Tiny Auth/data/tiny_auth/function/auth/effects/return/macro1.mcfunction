$data modify storage tiny_auth:temp returnEffects.HideParticles set from storage tiny_auth:keys auths[{UUID:$(UUID)}].active_effects[{id:"$(Id)"}].show_particles
execute unless data storage tiny_auth:temp returnEffects.HideParticles run data modify storage tiny_auth:temp returnEffects.HideParticles set value "false"
