# ```
# 终止一个**玩家**的using事件
# #bct:using.exit
# ```

scoreboard players set @s bct.fsm.using 0
tag @s remove bct.CONTEXT.hand.mainhand
tag @s remove bct.CONTEXT.hand.offhand
