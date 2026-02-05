# ```
# LEFT CLICK
# -> Context
# (Command) player  : 触发事件的玩家以及玩家的位置
# Context ->
# (Command) player  : 触发事件的玩家以及玩家的位置
# (Storage) command : 一段命令
# (Storage) hand    : 事件触发道具的手持情况(主副手)
# ```

data modify storage bct:io stack append value {CONTEXT:{hand:"mainhand"}}

function #bct:item.get
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".event.left_click
function #bct:macro with storage bct:io stack[-1]

data remove storage bct:io stack[-1]
