# ```
# 世界实体丢失
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"尝试追踪世界实体时出现错误：BCB-0-0-0-1",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"#bct:item.get",color:"yellow"}]},translate:""}\
    ]
    