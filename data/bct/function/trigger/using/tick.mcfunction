# ```
# TRIGGER-USING
# 伊桑桑桑桑桑-更好的右键检测：减半法
# https://vanillalibrary.mcfpp.top/datapack-index/feature/archive/202601/f/content.html
# ```

scoreboard players operation @s bct.fsm.using /= #2 bct.const

# Command
execute if entity @s[tag=bct.CONTEXT.hand.mainhand] run return run function bct:trigger/using/mainhand/main
execute if entity @s[tag=bct.CONTEXT.hand.offhand] run return run function bct:trigger/using/offhand/main

# Error
function bct:trigger/using/errors/0
