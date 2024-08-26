config = {}

config.clawMachineItemName = 'claw_machine'
config.availableToys = {
    ["humpy_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_01a",
        shoulderModel = "sum_prop_sum_arcade_plush_01a",
        name = "Humpy Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["muffy_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_02a",
        shoulderModel = "sum_prop_sum_arcade_plush_02a",
        name = "Muffy Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["saki_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_03a",
        shoulderModel = "sum_prop_sum_arcade_plush_03a",
        name = "Saki Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["poopie_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_04a",
        shoulderModel = "sum_prop_sum_arcade_plush_04a",
        name = "Poopie Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["smoker_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_05a",
        shoulderModel = "sum_prop_sum_arcade_plush_05a",
        name = "Smoker Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["grindy_tee_plushie"] = {
        model = "ch_prop_arcade_claw_plush_06a",
        shoulderModel = "sum_prop_sum_arcade_plush_06a",
        name = "Grindy Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["princess_tee_plushie"] = {
        model = "ch_prop_princess_robo_plush_07a",
        shoulderModel = "sum_prop_sum_arcade_plush_07a",
        name = "Princess Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["wasabi_kitty_tee_plushie"] = {
        model = "ch_prop_shiny_wasabi_plush_08a",
        shoulderModel = "sum_prop_sum_arcade_plush_08a",
        name = "Wasabi Kitty Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    },
    ["master_tee_plushie"] = {
        model = "ch_prop_master_09a",
        shoulderModel = "sum_prop_sum_arcade_plush_09a",
        name = "Master Tee Plushie",
        actions = {
            hug = true,
            shoulder = true
        }
    }
}

config.machinesCanBeHacked = false -- If true, machines can be hacked to get money from it.
config.itemNeededForHack = 'lockpick' -- Item needed to hack the machine. If false, no item is needed.
config.percentFromCollectedAmountAfterSuccessfulHack = 0.5 -- 0.5 = 50% of collected amount, 0.25 = 25% of collected amount, 0.1 = 10% of collected amount
config.cooldownAfterSuccessfulHack = 60 -- In seconds, before it can be hacked again. false to disable

config.needsToHaveToyInInventory = false -- If true, the player needs to have the toy in their inventory to refill it into machine.
config.chargeForToyRefill = 1000 -- If 0, it will be free. If 1, it will charge the player for refilling the toy.
config.drawPointPosition = true

config.chanceForPickup = 100 -- 100 = 100% chance, 50 = 50% chance, 0 = 0% chance (only used if toy doesnt have chance set)
config.chanceToDropItem = 30 -- 100 = 100% chance, 50 = 50% chance, 0 = 0% chance (only used if toy doesnt have dropChance set)

-- DO NOT TOUCH
config.toySpotOffsets = {
    [1] = { 0.02, -0.01, 1.01 },
	[2] = { 0.24, -0.04, 1.01 },
	[3] = { 0.29, 0.19, 1.01 },
	[4] = { 0.06, 0.2, 1.01 },
	[5] = { -0.24, 0.25, 1.02 },
	[6] = { -0.25, 0.55, 1.01 },
	[7] = { 0.01, 0.55, 1.04 },
	[8] = { 0.3, 0.55, 1.025 },
	[9] = { 0.2, 0.37, 1.01 },
	[10] = { -0.06, 0.37, 1.01 },
}
