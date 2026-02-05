# ```
# 道具使用时间戳标记 - 基于 gametime
# ```

execute store result score #cooldown bct.var run time query gametime
scoreboard players remove #cooldown bct.var 2
execute store result storage bct:io stack[-1].item_update.components."minecraft:custom_data".timestamp.right_click int 1 run scoreboard players get #cooldown bct.var
function #bct:item.update