# Load datapack. Set up scoreboard.
scoreboard objectives add draikken_ecb_xPos dummy
scoreboard objectives add draikken_ecb_yPos dummy
scoreboard objectives add draikken_ecb_zPos dummy
scoreboard objectives add draikken_ecb_enableBeamFlag trigger
scoreboard objectives add draikken_ecb_dropBeam trigger

tellraw @a {"text":"Loading End Crystal Beams datapack by: ","color":"green","extra":[{"text":"draikken","color":"gold","bold":"true","italic":"true"},{"text":"\n"},{"text":"For more information click here to go to the GitHub wiki page.","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://github.com/draikken/MinecraftDatapacks/wiki/Datapacks"}}]}
