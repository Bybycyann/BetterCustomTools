# ```
# 更新手持物品数据
# -> Input
# (Storage) item_update : 等待合并到物品数据中的内容.
# ```

execute unless entity BCB-0-0-0-1 run return run function bct:item/item_update/errors/-1
execute unless data storage bct:io stack[-1].item_update run return run function bct:item/item_update/errors/0
execute unless data storage bct:io stack[-1].CONTEXT.hand run return run function bct:item/item_update/errors/1
execute unless data storage bct:io stack[-1].CONTEXT{hand:"mainhand"} unless data storage bct:io stack[-1].CONTEXT{hand:"offhand"} run return run function bct:item/item_update/errors/2

execute if data storage bct:io stack[-1].CONTEXT{hand:"mainhand"} run return run function bct:item/item_update/mainhand
execute if data storage bct:io stack[-1].CONTEXT{hand:"offhand"} run function bct:item/item_update/offhand
