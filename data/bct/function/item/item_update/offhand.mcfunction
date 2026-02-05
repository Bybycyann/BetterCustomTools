execute unless items entity @s weapon.offhand * run return run function bct:item/item_update/errors/3

item replace entity BCB-0-0-0-1 container.0 from entity @s weapon.offhand
data modify entity BCB-0-0-0-1 item merge from storage bct:io stack[-1].item_update
item replace entity @s weapon.offhand from entity BCB-0-0-0-1 container.0
