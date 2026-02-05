# ```
# 下降沿
# ```

function #bct:using.exit

execute if data storage bct:io stack[-1].using.fe run return run data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using.fe
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using
