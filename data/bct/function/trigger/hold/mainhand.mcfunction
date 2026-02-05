# ```
# mainhand的道具事件
# ```

data modify storage bct:io stack append value {CONTEXT:{hand:"mainhand"}}

function #bct:item.get
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".event.hold
execute if data storage bct:io stack[-1].command run function #bct:macro with storage bct:io stack[-1]

data remove storage bct:io stack[-1]
