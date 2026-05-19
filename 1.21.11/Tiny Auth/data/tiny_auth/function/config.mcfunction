data modify storage tiny_auth:storage config_info set value [\
  {label:"Lockout Duration", type:"int", id:"lockout_duration", admin_input: "numpad"},\
  {label:"Max Login Attempts", type:"int", id:"max_attempts", admin_input: "numpad"},\
  {label:"Lock Attempts", type:"int", id:"lock_attempts", admin_input: "numpad"},\
  {label:"Max Password Length", type:"int", id:"max_password_length", admin_input: "numpad"},\
  {label:"Default Dimension", type:"string", id:"default_dimension", admin_input: "list", list: ["minecraft:overworld","minecraft:the_nether","minecraft:the_end"]},\
  {label:"Default X", type:"double", id:"default_x", admin_input: "floatnumpad"},\
  {label:"Default Y", type:"double", id:"default_y", admin_input: "floatnumpad"},\
  {label:"Default Z", type:"double", id:"default_z", admin_input: "floatnumpad"},\
  {label:"Default Yaw", type:"float", id:"default_yaw", admin_input: "floatnumpad"},\
  {label:"Default Pitch", type:"float", id:"default_pitch", admin_input: "floatnumpad"},\
  {label:"Default Gamemode", type:"string", id:"default_gamemode", admin_input: "list", list: ["adventure", "creative", "spectator", "survival"]},\
  {label:"GUI Theme", type:"string", id:"theme", admin_input: "list", list: ["whiteboard", "night_vision", "cyberpunk", "bloodline", "deep_sea","royal", "ender", "midnight", "quartz", "forest","bumblebee", "redstone", "frozen", "halloween", "retrowave","slate", "poison", "coffee", "ghost", "nebula","supernova", "void", "mars", "starlight", "cyber_lime","rose_gold", "copper", "velvet", "abyss", "solar","spectrum", "terminal", "elemental", "moonlight", "cyber_runner"]},\
  {label:"System Language", type:"string", id:"language", admin_input: "list", list: ["en-us","es-es","fr-fr","de-de","pt-br"]},\
  {label:"Experimental Custom Themes", type:"byte", id:"experimental_custom_themes", admin_input: "toggle"}\
]

data merge storage tiny_auth:config {\
  lockout_duration: 400,\
  max_attempts: 3,\
  lock_attempts: 5,\
  max_password_length: 16,\
  default_dimension: "minecraft:overworld",\
  default_x: 0.0d,\
  default_y: 0.0d,\
  default_z: 0.0d,\
  default_yaw: 0.0f,\
  default_pitch: 0.0f,\
  default_gamemode: "survival",\
  theme: "whiteboard",\
  language: "en-us",\
  experimental_custom_themes: 0b\
}
