execute unless items entity @s player.cursor * run return run function bct:trigger/right_click/remainder/errors/1

item replace entity BCB-0-0-0-1 container.0 from entity @s player.cursor
item replace entity @s player.cursor with minecraft:air
data modify storage bct:io stack[-1].item_update set from entity BCB-0-0-0-1 item
data remove storage bct:io stack[-1].item_update.components."minecraft:custom_data".tags[-1]
item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"!minecraft:custom_data":{},"!minecraft:use_remainder":{},"!minecraft:custom_name":{}}}
function #bct:item.update