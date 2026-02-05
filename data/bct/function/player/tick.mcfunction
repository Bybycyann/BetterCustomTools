# Error
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":300}} unless function pde:import run function bct:errors/0

# Trigger
    # Using
    execute unless entity @s[scores={bct.fsm.using=0}] run function bct:trigger/using/tick
