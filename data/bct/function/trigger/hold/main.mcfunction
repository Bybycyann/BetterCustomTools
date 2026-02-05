# ```
# Held
# 手持时tick触发
# -> Context
# (Command) player  : 触发事件的玩家以及玩家的位置
# Context ->
# (Command) player  : 触发事件的玩家以及玩家的位置
# (Storage) command : 一段命令
# (Storage) hand    : 事件触发道具的手持情况(主副手)
# ```
advancement revoke @s only bct:hold/hold

execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["#bct:hold"]}] run function bct:trigger/hold/mainhand
execute if items entity @s weapon.offhand *[minecraft:custom_data~{tags:["#bct:hold"]}] run function bct:trigger/hold/offhand
