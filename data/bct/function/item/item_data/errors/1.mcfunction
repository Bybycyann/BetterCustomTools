# ```
# 上下文参数 hand 错误
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"获取上下文时出现错误：意外的“%s”出现在CONTEXT.hand",with:[{storage:"bct:io",nbt:"stack[-1].CONTEXT.hand"}],translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"#bct:item.get",color:"yellow"}]},translate:""}\
    ]
    