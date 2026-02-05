# ```
# 缺少上下文参数 item_data
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"无法执行#bct:item.cd：缺少必要的上下文：item_data",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"#bct:item.cd",color:"yellow"}]},translate:""}\
    ]

return -1