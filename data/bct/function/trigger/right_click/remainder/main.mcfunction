# ```
# REMAINDER
# -> Context
# (Command) player  : 触发事件的玩家以及玩家的位置
# Context ->
# (Command) player  : 触发事件的玩家以及玩家的位置
# (Storage) command : 一段命令
# (Storage) hand    : 事件触发道具的手持情况(主副手)
# ```
advancement revoke @s only bct:right_click/remainder

data modify storage bct:io stack append value {CONTEXT:{}}

# 道具返还事件
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["$bct:used"]}] run function bct:trigger/right_click/remainder/mainhand/main
execute if items entity @s weapon.offhand *[minecraft:custom_data~{tags:["$bct:used"]}] run function bct:trigger/right_click/remainder/offhand/main

# 时间戳
function #bct:item.get
scoreboard players set #cooldown bct.var 0
execute if data storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:use_cooldown" store result score #cooldown bct.var run data get storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:use_cooldown".seconds
execute if score #cooldown bct.var matches 1.. run function bct:trigger/right_click/remainder/timestamp/main

data remove storage bct:io stack[-1]
