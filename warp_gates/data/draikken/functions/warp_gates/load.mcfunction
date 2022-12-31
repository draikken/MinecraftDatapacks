# Load datapack. Set up scoreboard.
scoreboard objectives add draikken_xPos dummy
scoreboard objectives add draikken_yPos dummy
scoreboard objectives add draikken_zPos dummy
scoreboard objectives add draikken_dimension dummy
scoreboard objectives add draikken_coordFlag dummy
scoreboard objectives add draikken_teleFlag dummy

tellraw @a {"text":"Loading Warp Gates datapack by: ","color":"green","extra":[{"text":"draikken","color":"gold","bold":"true","italic":"true"},{"text":"\n"},{"text":"For more information click here to go to the GitHub wiki page.","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://github.com/draikken/MinecraftDatapacks/wiki/Datapacks"}}]}
