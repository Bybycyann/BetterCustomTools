# ```
# 获取手持物品数据
# Context ->
# (Storage) item_data : 一个物品堆叠数据, 若为空则返回 "NULL".
# ```

execute unless entity BCB-0-0-0-1 run return run function bct:item/item_data/errors/-1
execute unless data storage bct:io stack[-1].CONTEXT.hand run return run function bct:item/item_data/errors/0
execute unless data storage bct:io stack[-1].CONTEXT{hand:"mainhand"} unless data storage bct:io stack[-1].CONTEXT{hand:"offhand"} run return run function bct:item/item_data/errors/1

execute if data storage bct:io stack[-1].CONTEXT{hand:"mainhand"} run function bct:item/item_data/mainhand
execute if data storage bct:io stack[-1].CONTEXT{hand:"offhand"} run function bct:item/item_data/offhand

execute if score #count bct.var matches ..0 run return run data modify storage bct:io stack[-1].CONTEXT.item_data set value "NULL"
data modify storage bct:io stack[-1].CONTEXT.item_data set from entity BCB-0-0-0-1 item
