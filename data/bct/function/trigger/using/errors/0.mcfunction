# ```
# 缺失上下文
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"解析上下文时出现错误：玩家缺少hand标签",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"bct:trigger/using/tick",color:"yellow"}]},translate:""}\
    ]
