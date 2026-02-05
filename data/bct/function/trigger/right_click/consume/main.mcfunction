# ```
# RIGHTC LICK
# -> Context
# (Command) player  : 触发事件的玩家以及玩家的位置
# Context ->
# (Command) player  : 触发事件的玩家以及玩家的位置
# (Storage) command : 一段命令
# (Storage) hand    : 事件触发道具的手持情况(主副手)
# ```
advancement revoke @s only bct:right_click/consume

data modify storage bct:io stack append value {CONTEXT:{hand:"mainhand"}}

# Context
function #bct:item.get
function bct:trigger/right_click/consume/_
execute if score #boole bct.var matches 1 run function bct:trigger/right_click/consume/__

# Error
execute if data storage bct:io stack[-1].CONTEXT{item_data:"NULL"} run return run function bct:trigger/right_click/consume/___

# Command
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".event.right_click
function #bct:macro with storage bct:io stack[-1]

# Tool Extend - 工具属性继承 (注意这里可能得加一条进度用于在意外情况下删除player.cursor的中转物品)
execute as @s[gamemode=!creative] if data storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:use_remainder".components."minecraft:custom_data".remainder{type:"self"} run function bct:trigger/right_click/consume/extend

data remove storage bct:io stack[-1]
