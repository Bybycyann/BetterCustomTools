execute if data storage pde:io input[-1].data.bct.using{tags:["$re"]} run return run data remove storage pde:io input[-1].data.bct.using.tags[-1]

execute if items entity @s weapon.offhand *[minecraft:custom_data~{tags:["#bct:using"]}] if score #return bct.var matches 0 run return 0
function #bct:using.exit
scoreboard players set #return bct.var 2