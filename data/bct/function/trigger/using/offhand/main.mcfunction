# ```
# offhand
# ```

data modify storage bct:io stack append value {CONTEXT:{hand:"offhand"}}

function #bct:item.get
data modify storage bct:io stack[-1].using set from storage bct:io stack[-1].CONTEXT.item_data.components."minecraft:custom_data".event.using
function bct:trigger/using/offhand/event/main

function #pde:data.rw {player:"this"}
    execute if score @s bct.fsm.using matches 3 run data modify storage pde:io input[-1].data.bct.using.tags append value "$re"
    execute store success score #return bct.var run data modify storage pde:io input[-1].data.bct.using.command set from storage bct:io stack[-1].command
    execute unless score @s bct.fsm.using matches 3 unless score @s bct.fsm.using matches 0 run function bct:trigger/using/offhand/_
    execute if score @s bct.fsm.using matches 0 run data remove storage pde:io input[-1].data.bct.using

execute if score #return bct.var matches 2 run return run data remove storage bct:io stack[-1]

function #bct:macro with storage bct:io stack[-1]

data remove storage bct:io stack[-1]
