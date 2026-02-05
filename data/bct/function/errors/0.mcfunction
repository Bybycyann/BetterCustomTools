# ```
# 缺少依赖项:
# PlayerDataExpansion
# ```

tellraw @s [\
    {"text":"[bct] ","hover_event":{"action":"show_text","value":[{"text":"BetterCustomTools"},"\n",{"text":"[lib]更好的自定义工具.","color":"green"}]}},\
    {"fallback":"error：%s","with":[{"fallback":"检察运行环境时出现错误：缺少依赖项“PlayerDataExpansion”","translate":""}],"color":"red","hover_event":{"action":"show_text","value":[{"text":"bct:tick","color":"yellow"}]},"translate":""}\
    ]
