data modify storage bct:io stack[-1].CONTEXT.hand set value "mainhand"
function #bct:item.get
# 调用战利品表返还
scoreboard players set #boole bct.var 1
execute unless data storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".remainder{type:"self"} run function bct:trigger/right_click/remainder/mainhand/loot/main
# 同步自身属性
execute if score #boole bct.var matches 1 run function bct:trigger/right_click/remainder/mainhand/self/main

# 返还追加命令
execute if data storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".command run function #bct:macro with storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data"