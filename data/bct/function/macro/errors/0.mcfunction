# ```
# 实例化宏错误
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"无法实例化函数#bct:macro：命令“%s”发生错误",with:[{storage:"bct:io",nbt:"stack[-1].command"}],translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"#bct:macro",color:"yellow"}]},translate:""}\
    ]