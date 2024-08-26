Config = {}

Config.Props = {
    `prop_dumpster_4b`,
    `prop_dumpster_4a`,
    `prop_dumpster_3a`,
    `prop_dumpster_02b`,
    `prop_dumpster_02a`,
    `prop_dumpster_01a`,
    `prop_snow_dumpster_01`
}


-- ## Reset Configs
Config.ResetOnReboot = true
Config.ResetTime = 60 -- If Config.ResetOnReboot = false. In minutes

-- ## Minigame Configs
Config.Minigame = "ps-ui" -- Available options: false, 'qb-lock', 'memorygame', 'ps-ui'

-- ## Time Configs
Config.ProgressTime = 2 -- In secondes

-- ## Police Configs
Config.Illegal = false -- True will send an alert using the % on Config.AlertChance
Config.AlertChance = 10
Config.Dispatch = 'qb-dispatch' -- Available options: 'qb-dispatch' or 'qb-core'

-- ## Hurting Configs
Config.Hurting = true -- True will give a chance to the player to be hurt
Config.HurtChance = 40 -- If Config.Hurting = true. In percentage
Config.CanBleed = true -- Can the player bleed? / Requires qb-ambulancejob
Config.BleedChance = 30 -- If Config.CanBleed = true. In percentage
Config.HurtDamage = {
    min = 5,
    max = 15,
}

-- ## Loot table
Config.CanLootMultiple = true -- Can the player loot multiple items?
Config.MaxLootItem = 4 -- If Config.CanLootMultiple = true. Max items the player can loot
Config.Loottable = {
    [1] = {item = 'recyclablematerial',         chances = 60,    min = 15,    max = 20},
    [2] = {item = 'sandwich',          chances = 70,   min = 1,    max = 2},
    [3] = {item = 'water_bottle',     chances = 70,   min = 1,    max = 2},
    [4] = {item = 'pistol_ammo',              chances = 97,   min = 1,    max = 2},
    [5] = {item = 'wet_gold_phone',   chances = 99,    min = 1,    max = 1},
    [6] = {item = 'powerbank',            chances = 98,   min = 1,    max = 1},
    [7] = {item = 'fitbit',             chances = 25,    min = 1,    max = 2},
    [8] = {item = 'firework2',          chances = 10,   min = 1,    max = 2},
    [9] = {item = 'rolex',          chances = 94,   min = 1,    max = 3},
    [10] = {item = 'uncut_diamond',          chances = 95,   min = 1,    max = 2},
    [11] = {item = 'uncut_sapphire',          chances = 95,   min = 1,    max = 2},
    [12] = {item = 'uncut_ruby',          chances = 95,   min = 1,    max = 2},
    [13] = {item = 'uncut_emerald',          chances = 95,   min = 1,    max = 2},
    [14] = {item = 'goldingot',          chances = 90,   min = 1,    max = 2},
    [14] = {item = 'cryptopaper',          chances = 90,   min = 1,    max = 1},
}
