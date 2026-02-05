# ```
# 检查目标物品是否在冷却中
# (基于 consume 提供的时间戳)
# -> Context
# (Storage) item_data : 一个物品堆叠数据.
# Return
# 0 : 冷却结束
# 1 : 冷却中
# ```

execute unless data storage bct:io stack[-1].CONTEXT.item_data run return run function bct:item/item_cooldown/errors/0

execute store result score #i bct.var run data get storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".timestamp.right_click
scoreboard players set #j bct.var 0
execute store result score #j bct.var run data get storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:use_cooldown".seconds 20
scoreboard players operation #i bct.var += #j bct.var
execute store result score #j bct.var run time query gametime
execute if score #i bct.var >= #j bct.var run \
    return 1
    return 0