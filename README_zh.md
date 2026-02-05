# 更好的自定义工具

[English](./README.md) | 简体中文

> **受支持的游戏版本**
>
> 26.1, 1.21.11, 1.21.10, 1.21.9, 1.21.8, 1.21.7, 1.21.6, 1.21.5, 1.21.4
>
> **依赖项**
>
> [PlayerDataExpansion](https://github.com/Bybycyann/PlayerDataExpansion)

## 概览

该数据包封装了使用、长按、手持和左键 (1.21.11+) 等物品事件触发器, 并针对物品冷却以及道具的主副手逻辑问题与原版做了兼容. 这使得我们可以仅通过配置物品组件的方式来调用各种交互效果.

## 函数

> *数据包提供了一些函数接口, 但通常为内部调用.*

|        函数        |                             功能                             |                             说明                             |
| :----------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|  `#bct:item.get`   |     获取物品数据到 `bct.io stack[-1].CONTEXT.item_data`      |             CONTEXT: {hand: (mainhand\|offhand)}             |
| `#bct:item.update` | 将 `bct:io stack[-1].item_update` 的数据合并到目标物品上 (merge) | CONTEXT: {hand: (mainhand\|offhand)<br />需要向 `bct:io stack[-1].item_update` 中传入待合并的数据 |
|   `#bct:item.cd`   | 获取目标物品的冷却情况, 返回值为 1 (冷却结束) 或 0 (冷却中)  |             CONTEXT: {hand: (mainhand\|offhand)              |
| `#bct:using.exit`  |                   打断一个使用状态 (using)                   |                              -                               |
|    `#bct:macro`    |                        调用一个宏命令                        | 需要向 `bct:io stack[-1].command` 中写入目标命令<br />需要将 `bct:io stack[-1]` 作为宏参数传入 |

## 物品注册

PDE 提供了一套基于数据组件的物品注册流程, 免去了创作过程中在触发器上耗费的时间.
其核心属性存储于物品的 custom_data 组件中, 与其它功能性组件搭配, 其结构如下:

```json
"minecraft:custom_data": {
    "id": "<自定义物品的命名空间id>",
    "tags": ["#bct:right_click", "#bct:using", "#bct:hold", "#bct:left_click"]
	"event": {
        "right_click": "<消耗时触发的命令>",
        "using": ({"re": "<上升沿命令>","ah": "<激活状态命令>","fe": "<下降沿命令>"}|"<通用命令>"),
        "hold": "<手持时触发的命令>",
        "left_click": "<左键时触发的命令>"
    }
}
```

对于 `right_click` 返还逻辑的补充, `use_remainder` 组件定义的返还道具中的 `custom_data` 组件也负责部分逻辑, 结构如下:

```json
"minecraft:use_remainder": {
    "id": "<自定义返还物品的命名空间id>"
    "components": {
    	"minecraft:custom_name": {"text": ""},
        "minecraft:custom_data": {
            "id": "<自定义物品的命名空间id>",
            "tags": ["$bct:used"],
            "command": "<追加命令 (在这一阶段执行对道具数据的更新逻辑)>"
        },
        <...other...>
    }
}
```

除上述 `custom_data` 组件管理核心属性外, 其余功能性组件搭配分为下述几类:

- **#bct:right_click**

```json
"minecraft:use_remainder": {
  "id": "minecraft:recovery_compass",
  "components": {
    "minecraft:custom_name": "",
    "minecraft:custom_data": {
      "id": "bct:example1",
      "tags": ["$bct:used"],
      "remainder": "bct:example1",
      "command": "me remainder1"
    }
  }
},
"minecraft:consumable": {
  "animation": "none",
  "consume_seconds": 0,
  "has_consume_particles": false,
  "sound": "minecraft:intentionally_empty"
}
```

其中 `consumable` 组件使道具可以使用, `use_remainder` 组件充当中转传递非消耗品的返还逻辑

- **#bct:using**

```json
"minecraft:consumable": {
  "animation": "bow",
  "consume_seconds": 99999999,
  "has_consume_particles": false,
  "sound": "minecraft:intentionally_empty"
}
```

`consumable` 组件使得物品可以被使用

- **#bct:hold**

```json
(empty)
```

没有什么必要的功能性组件

- **#bct:left_click**

```json
"minecraft:enchantments": {
  "bct:left_click": 1
},
"minecraft:minimum_attack_charge": 0,
"minecraft:piercing_weapon": {
  "sound": "minecraft:intentionally_empty",
  "hit_sound": "minecraft:intentionally_empty"
},
"minecraft:attack_range": {
  "min_reach": 0,
  "max_reach": 0,
  "min_creative_reach": 0,
  "max_creative_reach": 0,
  "hitbox_margin": 0,
  "mob_factor": 0
}
```

`enchantments` 组件用来给物品添加左键监听器的魔咒, `minimum_attack_charge` 用于管理事件的最短时间间隔, `piercing_weaoin` 为触发器所必须添加的组件, `attack_range` 用于管理物品的实体交互属性.

## 示例

包内提供了 7 个道具示例, [点击此处查看](https://github.com/Bybycyann/BetterCustomTools/tree/main/data/bct/loot_table).
