# Set draikken_coordFlag if not set already
execute as @s unless score @s draikken_coordFlag = @s draikken_coordFlag run scoreboard players set @s draikken_coordFlag 0

# Check if lever is part of a EW warp gate
execute positioned ~ ~1 ~ if score @s draikken_coordFlag matches 0 if block ~ ~ ~ minecraft:lever if block ~ ~1 ~ minecraft:lodestone if block ~1 ~1 ~ minecraft:deepslate_tile_stairs if block ~-1 ~1 ~ minecraft:deepslate_tile_stairs if block ~1 ~ ~ minecraft:deepslate_tiles if block ~-1 ~ ~ minecraft:deepslate_tiles if block ~1 ~-1 ~ minecraft:deepslate_tiles if block ~-1 ~-1 ~ minecraft:deepslate_tiles run function draikken:warp_gates/save_destination_coordinates

# Check if lever is part of a NS warp gate
execute positioned ~ ~1 ~ if score @s draikken_coordFlag matches 0 if block ~ ~ ~ minecraft:lever if block ~ ~1 ~ minecraft:lodestone if block ~ ~1 ~1 minecraft:deepslate_tile_stairs if block ~ ~1 ~-1 minecraft:deepslate_tile_stairs if block ~ ~ ~1 minecraft:deepslate_tiles if block ~ ~ ~-1 minecraft:deepslate_tiles if block ~ ~-1 ~1 minecraft:deepslate_tiles if block ~ ~-1 ~-1 minecraft:deepslate_tiles run function draikken:warp_gates/save_destination_coordinates

# Remove advancement so that this function can run again next time
advancement revoke @s only draikken:warp_gates/enter_ceiling_lever_unpowered