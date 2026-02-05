# ```
# 缺失 hand 上下文
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"无法执行#bct:item.update：缺少必要的上下文：hand",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"#bct:item.update",color:"yellow"}]},translate:""}\
    ]
