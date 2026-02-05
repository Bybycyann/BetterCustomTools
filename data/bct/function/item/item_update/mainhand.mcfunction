execute unless items entity @s weapon.mainhand * run return run function bct:item/item_update/errors/3

item replace entity BCB-0-0-0-1 container.0 from entity @s weapon.mainhand
data modify entity BCB-0-0-0-1 item merge from storage bct:io stack[-1].item_update
item replace entity @s weapon.mainhand from entity BCB-0-0-0-1 container.0
