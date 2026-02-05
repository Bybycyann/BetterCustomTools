# BetterCustomTools

English | [简体中文](./README_zh.md)

> **Supported Game Versions**
> 26.1, 1.21.11, 1.21.10, 1.21.9, 1.21.8, 1.21.7, 1.21.6, 1.21.5, 1.21.4
> **Dependencies**
> [PlayerDataExpansion](https://github.com/Bybycyann/PlayerDataExpansion)

## Overview

This datapack abstracts item interaction triggers such as **use**, **long-press**, **hold**, and **left-click** (1.21.11+), while remaining compatible with vanilla mechanics such as item cooldowns and mainhand/offhand logic.

## Functions

> *The datapack exposes several function interfaces, primarily intended for internal use.*

|      Function      |                           Purpose                            |                            Notes                             |
| :----------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|  `#bct:item.get`   | Retrieves item data into `bct.io stack[-1].CONTEXT.item_data` | Requires writing `"mainhand"` or `"offhand"` to `bct:io stack[-1].CONTEXT.hand` |
| `#bct:item.update` | Merges data from `bct:io stack[-1].item_update` into the target item | Requires specifying hand (`mainhand`/`offhand`) and providing update data in `bct:io stack[-1].item_update` |
|   `#bct:item.cd`   | Checks cooldown status of the target item; returns `1` (ready) or `0` (on cooldown) | Requires writing `"mainhand"` or `"offhand"` to `bct:io stack[-1].CONTEXT.hand` |
| `#bct:using.exit`  |               Cancels an ongoing "using" state               |                              -                               |
|    `#bct:macro`    |                   Executes a macro command                   | Requires writing the target command to `bct:io stack[-1].command` and passing `bct:io stack[-1]` as macro arguments |

## Item Registration

PDE provides a component-based item registration workflow, eliminating the need to spend time setting up complex triggers during content creation.

The core properties are stored in the item’s `custom_data` component. Combined with other functional components, the structure is as follows:

```json
"minecraft:custom_data": {
  "id": "<namespace:id of your custom item>",
  "tags": ["#bct:right_click", "#bct:using", "#bct:hold", "#bct:left_click"],
  "event": {
    "right_click": "<command executed on right-click>",
    "using": ({"re": "<rising-edge command>","ah": "<active-hold command>","fe": "<falling-edge command>"}|"<universal command>"),
    "hold": "<command executed while held>",
    "left_click": "<command executed on left-click>"
  }
}
```

For `right_click` return logic, the `use_remainder` component defines the returned item, whose `custom_data` also handles part of the logic:

```json
"minecraft:use_remainder": {
  "id": "<namespace:id of the returned custom item>",
  "components": {
    "minecraft:custom_name": {"text": ""},
    "minecraft:custom_data": {
      "id": "<namespace:id of your custom item>",
      "tags": ["$bct:used"],
      "command": "<append command (executed at this stage to update item data)>"
    },
    <...other...>
  }
}
```

In addition to the `custom_data` component managing core behavior, functional components are categorized as follows:

**#bct:right_click**

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

- The `consumable` component enables the item to be used.
- The `use_remainder` component acts as an intermediary to handle non-consumable return logic.

**#bct:using**

```json
"minecraft:consumable": {
  "animation": "bow",
  "consume_seconds": 99999999,
  "has_consume_particles": false,
  "sound": "minecraft:intentionally_empty"
}
```

- The `consumable` component allows the item to enter a "using" state.

**#bct:hold**

```json
(empty)
```

- No additional functional components are required.

**#bct:left_click**

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

- The `enchantments` component adds a left-click listener via a dummy enchantment.

- `minimum_attack_charge` controls the minimum interval between events.
- `piercing_weapon` is a required component for the trigger.
- `attack_range` configures entity interaction properties.

## Examples

The package includes 7 example items. [View them here](https://github.com/Bybycyann/BetterCustomTools/tree/main/data/bct/loot_table).
