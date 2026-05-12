$execute unless predicate {condition:"minecraft:value_check",value:$(theme_id),range:-1} run data modify storage tiny_auth:temp themeSet set from storage tiny_auth:visuals themes[{id:$(theme_id)}]
$execute if predicate {condition:"minecraft:value_check",value:$(theme_id),range:-1} run data modify storage tiny_auth:temp themeSet set from storage tiny_auth:keys auths[{UUID:$(UUID)}].CustomTheme

$execute unless predicate {condition:"minecraft:value_check",value:$(theme_id),range:-1} run data modify storage tiny_auth:temp show_dialog.theme set from storage tiny_auth:temp themeSet.name
$execute if predicate {condition:"minecraft:value_check",value:$(theme_id),range:-1} run data modify storage tiny_auth:temp show_dialog.theme set value "Custom Theme"

$function tiny_auth:auth/theme/set {key:"keyboard_1",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_2",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_3",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_4",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_5",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_6",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_7",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_8",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_9",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_0",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_q",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_w",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_e",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_r",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_t",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_y",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_u",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_i",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_o",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_p",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_a",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_s",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_d",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_f",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_g",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_h",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_j",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_k",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_l",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_z",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_x",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_c",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_v",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_b",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_n",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"keyboard_m",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_input",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_input_title",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_submit",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_clear",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_theme",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_language",theme_id:$(theme_id)}
$function tiny_auth:auth/theme/set {key:"key_title",theme_id:$(theme_id)}

