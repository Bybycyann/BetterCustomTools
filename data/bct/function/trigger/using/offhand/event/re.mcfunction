# ```
# 上升沿
# ```

execute if data storage bct:io stack[-1].using.re run return run data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using.re
data modify storage bct:io stack[-1].command set from storage bct:io stack[-1].using
