# ```
# 缺少道具
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"尝试追踪所使用道具时出现错误：未在mainhand或offhand发现符合条件的道具",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"bct:trigger/right_click/consume/main",color:"yellow"}]},translate:""}\
    ]