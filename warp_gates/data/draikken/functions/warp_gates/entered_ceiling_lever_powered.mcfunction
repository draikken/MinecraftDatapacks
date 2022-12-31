# Set draikken_teleFlag if not set already
execute as @s unless score @s draikken_teleFlag = @s draikken_teleFlag run scoreboard players set @s draikken_teleFlag 0

# Check if lever is part of a EW warp gate
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:lever if block ~ ~1 ~ minecraft:lodestone if block ~1 ~1 ~ minecraft:deepslate_tile_stairs if block ~-1 ~1 ~ minecraft:deepslate_tile_stairs if block ~1 ~ ~ minecraft:deepslate_tiles if block ~-1 ~ ~ minecraft:deepslate_tiles if block ~1 ~-1 ~ minecraft:deepslate_tiles if block ~-1 ~-1 ~ minecraft:deepslate_tiles if score @s draikken_teleFlag matches 0 run function draikken:warp_gates/teleport_destination_coordinates

# Check if lever is part of a NS warp gate
execute positioned ~ ~1 ~ if block ~ ~ ~ minecraft:lever if block ~ ~1 ~ minecraft:lodestone if block ~ ~1 ~1 minecraft:deepslate_tile_stairs if block ~ ~1 ~-1 minecraft:deepslate_tile_stairs if block ~ ~ ~1 minecraft:deepslate_tiles if block ~ ~ ~-1 minecraft:deepslate_tiles if block ~ ~-1 ~1 minecraft:deepslate_tiles if block ~ ~-1 ~-1 minecraft:deepslate_tiles if score @s draikken_teleFlag matches 0 run function draikken:warp_gates/teleport_destination_coordinates

# Remove advancement so that this function can run again next time
advancement revoke @s only draikken:warp_gates/enter_ceiling_lever_powered