# ```
# 错误的战利品表
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"无法实例化函数#bct:macro：命令“minecraft:loot_table”中找到元素“%s”",with:[{storage:"bct:io",nbt:"stack[-1].CONTEXT.item_data.components.\"minecraft:custom_data\".remainder"}],translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"bct:trigger/right_click/remainder/main",color:"yellow"}]},translate:""}\
    ]