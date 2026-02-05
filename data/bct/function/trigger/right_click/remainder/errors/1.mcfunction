# ```
# 光标槽中转数据丢失
# ```

tellraw @s [\
    {text:"[bct] ",hover_event:{action:"show_text",value:[{text:"BetterCustomTools"},"\n",{text:"[lib]更好的自定义工具.",color:"green"}]}},\
    {fallback:"error：%s",with:[{fallback:"尝试获取物品数据时发生错误：目标槽位player.cursor为空",translate:""}],color:"red",hover_event:{action:"show_text",value:[{text:"bct:trigger/right_click/remainder/main",color:"yellow"}]},translate:""}\
    ]
