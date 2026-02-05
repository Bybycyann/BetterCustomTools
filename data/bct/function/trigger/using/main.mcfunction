# ```
# USING
# -> Context
# (Command) player  : 触发事件的玩家以及玩家的位置
# Context ->
# (Command) player  : 触发事件的玩家以及玩家的位置
# (Storage) command : 一段命令
# (Storage) hand    : 事件触发道具的手持情况(主副手)
# ```
advancement revoke @s only bct:using/using

# State(+6) -0 ↑3 [other] ↓1 -0
scoreboard players add @s bct.fsm.using 6

# Init - CONTEXT.hand
execute if score @s bct.fsm.using matches 6 run function bct:trigger/using/init/main
