# ```
# using 事件初始化
# ```

data modify storage bct:io stack append value {CONTEXT:{hand:"mainhand"}}

scoreboard players reset #boole bct.var
function #bct:item.get
function bct:trigger/using/init/_
execute if score #boole bct.var matches 1 run tag @s add bct.CONTEXT.hand.offhand

data remove storage bct:io stack[-1]
