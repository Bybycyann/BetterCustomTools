# ```
# mainhand tool检查
# ```

execute if data storage bct:io stack[-1].CONTEXT{item_data:"NULL"} run return run scoreboard players set #boole bct.var 1
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["#bct:using"]}] run return run scoreboard players set #boole bct.var 1

# 冷却检查
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["#bct:right_click"]}] store result score #cooldown bct.var run function #bct:item.cd

execute if score #cooldown bct.var matches 1 run return run scoreboard players set #boole bct.var 1
tag @s add bct.CONTEXT.hand.mainhand
