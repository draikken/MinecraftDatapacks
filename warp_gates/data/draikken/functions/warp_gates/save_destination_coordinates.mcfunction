tellraw @s {"text":"Warp gate destination coordinates saved.","color":"gold"}

# Save player's coordinates
execute store result score @s draikken_xPos run data get entity @s Pos[0]
execute store result score @s draikken_yPos run data get entity @s Pos[1]
execute store result score @s draikken_zPos run data get entity @s Pos[2]

# Save player's dimension
execute if data entity @s {Dimension: "minecraft:overworld"} run scoreboard players set @s draikken_dimension 0
execute if data entity @s {Dimension: "minecraft:the_nether"} run scoreboard players set @s draikken_dimension 1
execute if data entity @s {Dimension: "minecraft:the_end"} run scoreboard players set @s draikken_dimension 2

# Prevent the player from setting new coordinates for 5 seconds so that the chat doesn't get flooded with tellraw messages
scoreboard players set @s draikken_coordFlag 1
schedule function draikken:warp_gates/clear_coordflag 5s