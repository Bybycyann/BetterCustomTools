# ```
# mainhand tool检查
# ```

execute if data storage bct:io stack[-1].CONTEXT{item_data:"NULL"} run return run scoreboard players set #boole bct.var 1
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["#bct:right_click"]}] run return run scoreboard players set #boole bct.var 1

# 冷却检查
execute store result score #boole bct.var run function #bct:item.cd