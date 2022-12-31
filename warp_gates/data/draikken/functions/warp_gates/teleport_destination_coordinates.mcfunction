# Summon assist entity
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["tp_entity"]}

# Set assist entity scoreboard
execute store result score @e[limit=1,tag=tp_entity] draikken_dimension run scoreboard players get @s draikken_dimension
execute store result score @e[limit=1,tag=tp_entity] draikken_xPos run scoreboard players get @s draikken_xPos
execute store result score @e[limit=1,tag=tp_entity] draikken_yPos run scoreboard players get @s draikken_yPos
execute store result score @e[limit=1,tag=tp_entity] draikken_zPos run scoreboard players get @s draikken_zPos

# If teleporting from Nether to Overworld/End, divide x and z by 8
execute if data entity @s {Dimension: "minecraft:the_nether"} unless score @s draikken_dimension matches 1 store result entity @e[limit=1,tag=tp_entity] Pos[0] double 0.125 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_xPos
execute if data entity @s {Dimension: "minecraft:the_nether"} unless score @s draikken_dimension matches 1 store result entity @e[limit=1,tag=tp_entity] Pos[2] double 0.125 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_zPos

# If teleporting to Nether from Overworld/End, multiply x and z by 8
execute unless data entity @s {Dimension: "minecraft:the_nether"} if score @s draikken_dimension matches 1 store result entity @e[limit=1,tag=tp_entity] Pos[0] double 8 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_xPos
execute unless data entity @s {Dimension: "minecraft:the_nether"} if score @s draikken_dimension matches 1 store result entity @e[limit=1,tag=tp_entity] Pos[2] double 8 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_zPos

# Teleport assist entity to destination dimension
execute if score @e[limit=1,tag=tp_entity] draikken_dimension matches 0 as @e[limit=1,tag=tp_entity] at @s in minecraft:overworld run tp ~ ~ ~
execute if score @e[limit=1,tag=tp_entity] draikken_dimension matches 1 as @e[limit=1,tag=tp_entity] at @s in minecraft:the_nether run tp ~ ~ ~
execute if score @e[limit=1,tag=tp_entity] draikken_dimension matches 2 as @e[limit=1,tag=tp_entity] at @s in minecraft:the_end run tp ~ ~ ~

# Move assist entity to destination coordinates
execute store result entity @e[limit=1,tag=tp_entity] Pos[0] double 1 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_xPos
execute store result entity @e[limit=1,tag=tp_entity] Pos[1] double 1 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_yPos
execute store result entity @e[limit=1,tag=tp_entity] Pos[2] double 1 run scoreboard players get @e[limit=1,tag=tp_entity] draikken_zPos

# Save coordinates of source warp gate
execute as @s run function draikken:warp_gates/save_source_coordinates

# Teleport player to assist entity
tp @s @e[limit=1,tag=tp_entity]

# Prevent the player from teleporting for 5 seconds
scoreboard players set @s draikken_teleFlag 1
schedule function draikken:warp_gates/clear_teleflag 5s