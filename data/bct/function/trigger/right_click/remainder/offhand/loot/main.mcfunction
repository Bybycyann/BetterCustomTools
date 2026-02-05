scoreboard players set #boole bct.var 0

scoreboard players set #exe bct.var 0
execute store result score #exe bct.var run function bct:trigger/right_click/remainder/offhand/loot/macro with storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data"
execute if score #exe bct.var matches 0 run function bct:trigger/right_click/remainder/errors/0
