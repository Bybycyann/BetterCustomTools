# ```
# 激活状态
# ```

execute if data storage bct:io stack[-1].using.ah run return run data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using.ah
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using
