$data modify storage bct:io stack append value {command:"$(command)"}

scoreboard players set #exe bct.var 0
execute store result score #exe bct.var run function bct:macro/macro with storage bct:io stack[-1]
execute if score #exe bct.var matches 0 run function bct:macro/errors/0

data remove storage bct:io stack[-1]