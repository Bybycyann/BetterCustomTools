execute store result score #count bct.var if items entity @s weapon.mainhand *
execute if score #count bct.var matches ..0 run return 0
item replace entity BCB-0-0-0-1 container.0 from entity @s weapon.mainhand