Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.EnableProne = true
Config.MaxSpeedKmh = 190
Config.maxJumpHeight = 8.0
Config.LoseConnectionDistance = 100.0
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level
Config.GiftItems = {
    ['phone'] = 1,           --value is the amount of each item, example: lockpick has an amount of 5
    ['sandwich'] = 5,
    ['water_bottle'] = 5,
}
Config.Text = "[G] To Release [H] To Kill"
ConsumeablesEat = {
    ["sandwich"] = math.random(3, 6),
	["adrenaline"] = math.random(100, 100),
	["margherita"] = math.random(35, 54),
	["quinoa"] = math.random(5, 7),
	["burgershot_bigking"] = math.random(40, 50),
	["burgershot_bleeder"] = math.random(40, 50),
	["burgershot_goatwrap"] = math.random(50, 60),
	["burgershot_macaroon"] = math.random(80, 95),
	["burgershot_patatob"] = math.random(35, 40),
	["burgershot_patatos"] = math.random(25, 45),
	["burgershot_shotnuggets"] = math.random(40, 50),
	["burgershot_shotrings"] = math.random(40, 50),
	["burgershot_thesmurfsicecream"] = math.random(20, 25),
	["burgershot_smurfetteicecream"] = math.random(20, 25),
	["burgershot_matchaicecream"] = math.random(70, 80),
	["burgershot_ubeicecream"] = math.random(20, 25),
	["burgershot_unicornicecream"] = math.random(20, 25),
	["burgershot_vanillaicecream"] = math.random(20, 25),
	["burgershot_chocolateicecream"] = math.random(20, 25),
	["burgershot_strawberryicecream"] = math.random(20, 25),
	["tiramisu"] = math.random(35, 54),
	["medfruits"] = math.random(35, 54),
	["vegetariana"] = math.random(35, 54),
	["capricciosa"] = math.random(35, 54),
	["diavola"] = math.random(35, 54),
	["prosciuttio"] = math.random(35, 54),
	["marinara"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
	["cheesecake"] = math.random(40, 50),
	["gelato"] = math.random(40, 50),
	["crisps"] = math.random(40, 50),
	--CLUB77
	["clubedamame"] = math.random(40, 50),
	["clubhummus"] = math.random(40, 50),
	["clubschnitzels"] = math.random(40, 50),
	["clubchips"] = math.random(40, 50),
	["clubfriedplatter"] = math.random(40, 50),
	["clubfruitstray"] = math.random(40, 50),
	["clubvegetableplatter"] = math.random(40, 50),
	["clubarais"] = math.random(40, 50),
	["clubtrailmix"] = math.random(40, 50),
	["tripcucumber"] = math.random(40, 50),
	--
	["chicken-burrito"] = math.random(40, 50),
	["nachos"] = math.random(40, 50),
	["quesadilla"] = math.random(20, 40),
	["beef-taco"] = math.random(40, 50),
	["cookies"] = math.random(40, 50),
	["croissant"] = math.random(40, 50),
	["cupchocolate"] = math.random(40, 50),
	["snikkel_candy"] = math.random(40, 50),
	["cookie"] = math.random(40, 50),
	["donut"] = math.random(40, 50),
	["croissant"] = math.random(40, 50),
	["cupchocolate"] = math.random(40, 50),
	["snikkel_candy"] = math.random(40, 50),
	["cookie"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["pangash_bhat"] = math.random(35, 54),
    ["morog_polao"] = math.random(40, 50),
    ["dim_polao"] = math.random(40, 50),
    ["kacci"] = math.random(40, 50),
    ["bengali_platter"] = math.random(50, 95),
    ["roshomalai"] = math.random(40, 50),
    ["cha"] = math.random(40, 50),
    ["fuchka"] = math.random(40, 50),
    ["burger-bleeder"] = math.random(40, 50),
	["taco-bleeder"] = math.random(40, 50),
    ["burger-moneyshot"] = math.random(40, 50),
	["taco-moneyshot"] = math.random(40, 50),
    ["burger-torpedo"] = math.random(40, 50),
	["taco-torpedo"] = math.random(40, 50),
    ["burger-heartstopper"] = math.random(40, 50),
	["taco-heartstopper"] = math.random(40, 50),
    ["burger-meatfree"] = math.random(40, 50),
	["taco-meatfree"] = math.random(40, 50),
    ["burger-fries"] = math.random(40, 50),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(3, 6),
	["v-class"] = math.random(30, 40),
	["beer"] = math.random(7, 10),
    ["burger-softdrink"] = math.random(35, 54),
    ["burger-mshake"] = math.random(35, 54),
    ["coke"] = math.random(35, 54),
	["burgershot_colab"] = math.random(40, 50),
	["burgershot_colas"] = math.random(20, 30),
	["burgershot_coffee"] = math.random(10, 20),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
	["bean-latte"] = math.random(40, 50),
	["bean-cappuccino"] = math.random(40, 50),
	["bean-mocha"] = math.random(40, 50),
	["bean-cmilkshake"] = math.random(40, 50),
	["bean-icetea"] = math.random(40, 50),
	["bean-cafe"] = math.random(40, 50),
	["ecocoffee"] = math.random(40, 50),
	["bigfruit"] = math.random(40, 50),
	["highnoon"] = math.random(40, 50),
	["speedball"] = math.random(40, 50),
	["gunkaccino"] = math.random(40, 50),
	["bratte"] = math.random(40, 50),
	["flusher"] = math.random(40, 50),
	["caffeagra"] = math.random(40, 50),
    ["cocacola"] = math.random(35, 54),
	["ecola"] = math.random(35, 54),
	["sprunk"] = math.random(35, 54),
    ["borhani"] = math.random(40, 50),
    ["zirapani"] = math.random(35, 54),
	["clubcola"] = math.random(35, 54),
	["clubsprite"] = math.random(35, 54),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["vodka"] = math.random(20, 40),
	["v-hulk"] = math.random(30, 40),
    ["v-dancerz"] = math.random(30, 40),
    ["v-unicorn"] = math.random(30, 40),
    ["v-sparkles"] = math.random(30, 40),
    ["v-oldfashioned"] = math.random(30, 40),
    ["v-margarita"] = math.random(30, 40),
    ["v-manhattan"] = math.random(30, 40),
    ["v-espressomartini"] = math.random(30, 40),
    ["shot-absinthe"] = math.random(30, 40),
    ["shot-redsnapper"] = math.random(30, 40),
    ["shot-snakebite"] = math.random(30, 40),
    ["shot-fireball"] = math.random(30, 40),
	["coronabeer"] = math.random(35, 54),
	["finlandia"] = math.random(35, 54),
	["beluga"] = math.random(35, 54),
	["colazero"] = math.random(35, 54),
	["gregos"] = math.random(35, 54),
	["yellowvodka"] = math.random(35, 54),
	["vangoghacai"] = math.random(35, 54),
	["blu"] = math.random(20, 40),
	["adrenaline"] = math.random(100, 100),
}

ConsumeablesStress =  {
    ["adrenaline"] = math.random(30, 50),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`buzzard`] = true,
	[`policeb`] = true,
	[`ambulance`] = false,
    -- [`savage`] = true,
    [`akula`] = true,
    [`JET`] = true,
    [`annihilator2`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    -- [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`blimp`] = true,
    [`metrotrain`] = true,
    [`hydra`] = true,
	[`bulldozer`] = true,
    [`freight`] = true,
	[`freightcar`] = true,
	[`freightrain`] = true,
	[`hydra2`] = true,
    [`hunter`] = true,
    [`valkyrie`] = true,
    [`valkyrie2`] = true,
    [`cargobob`] = true,
    [`cargobob2`] = true,
    [`cargobob3`] = true,
    [`cargobob4`] = true,
    [`apc`] = true,
    [`insurgent`] = true,
    [`insurgent3`] = true,
    [`technical`] = true,
    [`menacer`] = true,
    [`AIRTUG`] = true,
    [`hellion`] = true, 
	[`lazer`] = true, 
	[`technical2`] = true, 
	[`technical3`] = true, 
	[`alkonost`] = true,
	[`khanjali`] = true, 
	[`halftrack`] = true, 
	[`minitank`] = true, 
	[`scarab`] = true, 
	[`scarab2`] = true, 
	[`scarab3`] = true, 
	[`thruster`] = true, 
	[`trailersmall2`] = true, 
	[`chernobog`] = true,
	[`barrage`] = true, 
	[`oppressor2`] = true, 
	[`oppressor`] = true, 
	[`rrocket`] = true, 
	[`shotaro`] = true, 
	[`chernobog`] = true, 
	[`imperator`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

Config.Teleports = {
    --Elevator @ labs
    -- [1] = {
    --     [1] = {
    --         coords = vector4(316.40914, -578.3554, 43.275642, 158.89146),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Up'
    --     },
    --     [2] = {
    --         coords = vector4(338.65188, -583.7138, 74.161712, 69.826866),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Down'
    --     },

    -- },
    [2] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },

	-- [3] = {
    --     [1] = {
    --         coords = vector4(345.7, -582.34, 28.8, 73.93),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Up'
    --     },
    --     [2] = {
    --         coords = vector4(327.14, -603.88, 43.28, 158.55),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Down'
    --     },

    -- },
	[4] = {
		[1] = {
		coords = vector4(-1107.19, -832.33, 37.68, 213.01),
		["AllowVehicle"] = false,
		drawText = '[E] Take Elevator Down'
	},
	[2] = {
		coords = vector4(-1092.48, -848.22, 13.53, 122.01),
		["AllowVehicle"] = false,
		drawText = '[E] Take Elevator Up'
	},
    },
	-- [5] = {
    --     [1] = {
    --         coords = vector4(345.7, -582.34, 28.8, 73.93),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Up'
    --     },
    --     [2] = {
    --         coords = vector4(327.14, -603.88, 43.28, 158.55),
    --         ["AllowVehicle"] = false,
    --         drawText = '[E] Take Elevator Down'
    --     },

    -- },
	
}

Config.vehicleList = {
    { name = "Panto", model = "panto", price = 250 },
    { name = "Blista", model = "blista", price = 400 },
    { name = "Futo", model = "futo", price = 550 },
    { name = "PCJ 600", model = "pcj", price = 950 },
    { name = "Festival Bus", model = "pbus2", price = 6250 },
}

Config.SellableItems = {
    ['markedbills'] = math.random(1000, 4000),
    ['cryptostick'] = math.random(250,300),
    ['iphone'] = 500,
    ['samsungphone'] = 400,
    ['laptop'] = math.random(900, 1200),
    ['tablet'] = math.random(250, 350),
    ['goldchain'] = math.random(700, 1000),
    ['10kgoldchain'] = math.random(1000, 1200),
    ['diamond_ring'] = math.random(700, 1000),
    ['goldbar'] = math.random(1000, 1000),
    ['rolex'] = math.random(700, 750),
    ['ruby'] = math.random(200, 250),
    ['emerald'] = math.random(200, 250),
    ['sapphire'] = math.random(200, 250),
    ['gallary_egg'] = math.random(200, 250),
    ['gallary_skull'] = math.random(200, 250),
    ['gallary_dragon'] = math.random(200, 250),
    ['guitar'] = math.random(200, 250),
    ['ruby_ring'] = math.random(200, 250),
    ['diamond'] = math.random(200, 250),
    ['gold_ring'] = math.random(200, 250),
    ['sapphire_ring'] = math.random(200, 250),
    ['emerald_ring'] = math.random(200, 250),
    ['ruby_necklace'] = math.random(200, 250),
    ['emerald_necklace'] = math.random(200, 250),
    ['sapphire_necklace'] = math.random(200, 250),
    ['diamond_necklace'] = math.random(200, 250),
    ['carbon'] = math.random(200, 250),
    ['goldore'] = math.random(200, 250),
    ['trophy'] = math.random(200, 250),
    ['aquamarine_ring'] = math.random(200, 250),
    ['citrine_ring'] = math.random(200, 250),
    ['diamond_ring'] = math.random(200, 250),
    ['jade_ring'] = math.random(200, 250),
    ['onyx_ring'] = math.random(200, 250),
    ['ruby_ring'] = math.random(200, 250),
    ['tanzanite_ring'] = math.random(200, 250),
    ['sapphire_ring'] = math.random(200, 250),
}

--- Location Picker

-- local setLocPick = math.random(1, 3) -- un-comment me out for location change
local setLocPick = 1 -- comment me out for location change

Config.LocationSets = {
    [1] = {
        ["x"] = -1556.84,
        ["y"] = -417.02,
        ["z"] = 38.1,
        ["h"] = 89.15,
    },
    -- [2] = {
    --     ["x"] = 1601.25,
    --     ["y"] = 3589.39,
    --     ["z"] = 38.77,
    --     ["h"] = 131.8,
    -- },
    -- [3] = {
    --     ["x"] = 1983.89,
    --     ["y"] = 5175.6,
    --     ["z"] = 47.64,
    --     ["h"] = 122.74,
    -- },
} 

Config.Locations = {
    ["market"] = {
        ["label"] = "market",
        ["type"] = "mark",
        ["coords"] = {
            [1] = {
                ["x"] = tonumber(Config.LocationSets[setLocPick]["x"]),
                ["y"] = tonumber(Config.LocationSets[setLocPick]["y"]),
                ["z"] = tonumber(Config.LocationSets[setLocPick]["z"]),
                ["h"] = tonumber(Config.LocationSets[setLocPick]["h"]),
            },
        },
        ["products"] = Config.Products,
    },
}

--- Shop Times

Config.Open = 8

Config.Close = 14

Config.CraftingTime = 15 -- Time in seconds (15*1000ms)

Config.Cost = 15000 -- $50000 to manufacture forged identity

Config.getCoords = false -- useful for getting adding locations, only enable this if you're getting coords - (/mycoords in chat)

Config.policeJob = "police" -- change this to the name of the police job on your server - (name, not label)
Config.amountCop = 3 -- change this to increase/decrease the amount of police needed to start the mission with difficulty 1 
Config.hideBlip = false -- change this if you want the starting location to have a blip - (true/false)
Config.cleanDead = false -- change this if you want the peds to be deleted once they die - (true/false)
Config.printRemaining = true -- change this to show the amount of remaining enemies - (true/false)
Config.useNotification = true-- change this if you want to use mythic_notify to draw notifications - (true/false)
Config.progBar = true -- change this if you want to use progressBar or not - (true/false)
Config.removeArea = true -- change this if you want the red circle to disappear once you're at the location - (true/false)
Config.useDirtyMoney = true -- change this if you want to receive dirty money for selling dog tags - (true/false)
Config.waypoint = true -- change this to set a waypoint to the spawn location once you're close enough - (true/false)
Config.blipSprite = 90 -- if hideBlip is false then change this to your preferred sprite - (list of sprites: https://wiki.gtanet.work/index.php?title=Blips)
Config.enemies = 20 -- change this to the amount of enemies you want to spawn at a location. If this is 20 then 2-4 players are recommended. Tested with 10 - (10-20 enemies recommended)
Config.enemyHealth = 500 -- change this to the amount of health you want the enemies to have - (400 is default)
Config.enemyAcc = 100 -- change this to the accuracy you want the enemies to have. Recommend increasing this based on Config.enemies - (40% is default)
Config.enemyVest = true -- change this if you want to give the enemies armor - (true/false)
Config.enemyArmor = 100 -- change this to the amount you want if enemyVest is true - (0-100%)
Config.radius = 500.0 -- change this to increase/decrease the radius of the search area. If you go below 500 you will have to change some of the spawn locations - (float value)
Config.distance = 200 -- change this to increase/decrease the distance at which the enemies spawn - (might see enemies pop in with lower values)
Config.maxDistance = 400 -- change this to increase/decrease the max. distance you can be away from the enemies before the mission fails - (Keep higher than Config.distance)
Config.boxProp = "prop_mb_crate_01b" -- change the prop that will be used as a lootable source. Adjust crate x,y,z,h accordingly - (list of props: https://plebmasters.de/?app=objects)

Config.PolyChairs = {
	[1] = {
		coords = vector3(-1195.44, -883.55, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5,
	},
	[2] = {
		coords = vector3(-1194.96, -884.31, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[3] = {
		coords = vector3(-1193.82, -882.47, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[4] = {
		coords = vector3(-1193.30, -883.22, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[5] = {
		coords = vector3(-1192.98, -881.81, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[6] = {
		coords = vector3(-1192.48, -882.60, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[7] = {
		coords = vector3(-1191.01, -881.64, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[8] = {
		coords = vector3(-1191.52, -880.80, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[9] = {
		coords = vector3(-1189.33, -879.31, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[10] = {
		coords = vector3(-1189.85, -879.69, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[11] = {
		coords = vector3(-1188.14, -879.62, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[12] = {
		coords = vector3(-1187.72, -880.32, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[13] = {
		coords = vector3(-1187.08, -881.23, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[14] = {
		coords = vector3(-1187.89, -881.76, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[15] = {
		coords = vector3(-1185.99, -882.92, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[16] = {
		coords = vector3(-1186.81, -883.47, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[17] = {
		coords = vector3(-1183.18, -886.96, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[18] = {
		coords = vector3(-1183.96, -887.49, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[19] = {
		coords = vector3(-1182.06, -888.64, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[20] = {
		coords = vector3(-1182.87, -889.20, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[21] = {
		coords = vector3(-1180.97, -891.36, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[22] = {
		coords = vector3(-1181.82, -891.92, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[23] = {
		coords = vector3(-1181.00, -890.16, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[24] = {
		coords = vector3(-1181.41, -889.55, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[25] = {
		coords = vector3(-1183.94, -892.23, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[26] = {
		coords = vector3(-1183.43, -892.91, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[27] = {
		coords = vector3(-1184.89, -893.88, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[28] = {
		coords = vector3(-1185.38, -893.11, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[29] = {
		coords = vector3(-1185.72, -894.48, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[30] = {
		coords = vector3(-1186.22, -893.72, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[31] = {
		coords = vector3(-1187.37, -895.61, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[32] = {
		coords = vector3(-1187.89, -894.86, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[33] = {
		coords = vector3(-1191.19, -885.34, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[34] = {
		coords = vector3(-1190.86, -885.78, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[35] = {
		coords = vector3(-1191.12, -886.88, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[36] = {
		coords = vector3(-1191.76, -887.33, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[37] = {
		coords = vector3(-1192.77, -887.12, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[38] = {
		coords = vector3(-1193.15, -886.60, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[39] = {
		coords = vector3(-1189.26, -892.31, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[40] = {
		coords = vector3(-1189.65, -891.76, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[41] = {
		coords = vector3(-1189.37, -890.67, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[42] = {
		coords = vector3(-1188.82, -890.28, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[43] = {
		coords = vector3(-1187.85, -890.23, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[44] = {
		coords = vector3(-1187.50, -890.74, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[45] = {
		coords = vector3(-1193.91, -887.50, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[46] = {
		coords = vector3(-1192.99, -888.86, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[47] = {
		coords = vector3(-1191.30, -891.31, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[48] = {
		coords = vector3(-1190.44, -892.68, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[49] = {
		coords = vector3(-1188.91, -896.76, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[50] = {
		coords = vector3(-1189.62, -897.21, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[51] = {
		coords = vector3(-1190.85, -897.04, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[52] = {
		coords = vector3(-1191.33, -896.33, 14.0),
		heading = 303.0,
		length = 0.6,
		width = 0.6,
		minZ = 13.0,
		maxZ = 14.2,
		zOffset = -0.5
	},
	[53] = {
		coords = vector3(-1200.55, -887.10, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[54] = {
		coords = vector3(-1203.02, -888.78, 14.0),
		heading = 213.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.99,
		maxZ = 14.19,
		zOffset = -0.5
	},
	[55] = {
		coords = vector3(-1180.80, -900.72, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.99,
		maxZ = 14.19,
		zOffset = -0.5
	},
	[56] = {
		coords = vector3(-1185.43, -904.10, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.55
	},
	[57] = {
		coords = vector3(-1184.68, -903.58, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.55
	},
	[58] = {
		coords = vector3(-1188.82, -903.77, 14.0),
		heading = 330.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[59] = {
		coords = vector3(-1187.79, -901.57, 14.0),
		heading = 309.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[60] = {
		coords = vector3(-1188.45, -900.58, 14.0),
		heading = 289.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[61] = {
		coords = vector3(-1186.65, -899.34, 14.0),
		heading = 199.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[62] = {
		coords = vector3(-1177.39, -895.82, 14.0),
		heading = 123.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[63] = {
		coords = vector3(-1179.68, -896.44, 14.0),
		heading = 294.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[64] = {
		coords = vector3(-1178.90, -897.46, 14.0),
		heading = 324.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.5
	},
	[65] = {
		coords = vector3(-1177.84, -899.15, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.55
	},
	[66] = {
		coords = vector3(-1177.11, -898.76, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.55
	},
	[67] = {
		coords = vector3(-1176.38, -898.29, 14.0),
		heading = 33.0,
		length = 0.6,
		width = 0.6,
		minZ = 12.98,
		maxZ = 14.18,
		zOffset = -0.55
	},
}

Config.Props = {
	"prop_bench_01a",
	"prop_bench_01b",
	"prop_bench_01c",
	"prop_bench_02",
	"prop_bench_03",
	"prop_bench_04",
	"prop_bench_05",
	"prop_bench_06",
	"xm_lab_chairarm_02",
	"prop_bench_05",
	"prop_bench_08",
	"prop_bench_09",
	"prop_bench_10",
	"prop_bench_11",
	"prop_fib_3b_bench",
	"prop_ld_bench01",
	"prop_wait_bench_01",
	"hei_prop_heist_off_chair",
	"v_res_fh_dineeamesa",
	"v_res_fh_dineeamesb",
	"hei_prop_hei_skid_chair",
	"kachal_kk_barrelchair",
	"prop_chair_01a",
	"prop_chair_01b",
	"prop_chair_02",
	"prop_chair_03",
	"prop_chair_04a",
	"prop_chair_04b",
	"prop_chair_05",
	"prop_chair_06",
	"prop_chair_05",
	"prop_chair_08",
	"prop_chair_09",
	"prop_chair_10",
	"prop_chateau_chair_01",
	"prop_clown_chair",
	"prop_cs_office_chair",
	"prop_direct_chair_01",
	"prop_direct_chair_02",
	"prop_gc_chair02",
	"prop_off_chair_01",
	"prop_off_chair_03",
	"prop_off_chair_04",
	"prop_off_chair_04b",
	"prop_off_chair_04_s",
	"prop_off_chair_05",
	"prop_old_deck_chair",
	"prop_old_wood_chair",
	"prop_rock_chair_01",
	"prop_skid_chair_01",
	"prop_skid_chair_02",
	"prop_skid_chair_03",
	"prop_sol_chair",
	"prop_wheelchair_01",
	"prop_wheelchair_01_s",
	"p_armchair_01_s",
	"p_clb_officechair_s",
	"p_dinechair_01_s",
	"p_ilev_p_easychair_s",
	"p_soloffchair_s",
	"p_yacht_chair_01_s",
	"v_club_officechair",
	"v_corp_bk_chair3",
	"v_corp_cd_chair",
	"v_corp_offchair",
	"v_ilev_chair02_ped",
	"v_ilev_hd_chair",
	"v_ilev_p_easychair",
	"v_ret_gc_chair03",
	"prop_ld_farm_chair01",
	"prop_table_04_chr",
	"prop_table_05_chr",
	"prop_table_06_chr",
	"v_ilev_leath_chr",
	"prop_table_01_chr_a",
	"prop_table_01_chr_b",
	"prop_table_02_chr",
	"prop_table_03b_chr",
	"prop_table_03_chr",
	"prop_torture_ch_01",
	"v_ilev_fh_dineeamesa",
	"v_ilev_fh_kitchenstool",
	"v_ilev_tort_stool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"v_ilev_fh_kitchenstool",
	"hei_prop_yah_seat_01",
	"hei_prop_yah_seat_02",
	"hei_prop_yah_seat_03",
	"prop_waiting_seat_01",
	"prop_yacht_seat_01",
	"prop_yacht_seat_02",
	"prop_yacht_seat_03",
	"prop_hobo_seat_01",
	"prop_rub_couch01",
	"miss_rub_couch_01",
	"prop_ld_farm_couch01",
	"prop_ld_farm_couch02",
	"prop_rub_couch02",
	"prop_rub_couch03",
	"prop_rub_couch04",
	"p_lev_sofa_s",
	"p_res_sofa_l_s",
	"p_v_med_p_sofa_s",
	"p_yacht_sofa_01_s",
	"v_ilev_m_sofa",
	"v_res_tre_sofa_s",
	"v_tre_sofa_mess_a_s",
	"v_tre_sofa_mess_b_s",
	"v_tre_sofa_mess_c_s",
	"prop_roller_car_01",
	"prop_roller_car_02",
}

Config.Sitable = {
	--Only verticalOffset works right now!	
	--all scenarios: pastebin.com/6mrYTdQv
	
	-- BENCH
	prop_bench_01a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_01b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_01c 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_02 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_03 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_04 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_06 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_07 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_08 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_09 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_10 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_bench_11 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_fib_3b_bench 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_ld_bench01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_wait_bench_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },

	-- CHAIR
	hane_coolbeans_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_res_fh_dineeamesa 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_res_fh_dineeamesb 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	kachal_kk_barrelchair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_08_chr 		    = { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	uniqx_burgershot_seating01 	= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	hei_prop_heist_off_chair 	= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	hei_prop_hei_skid_chair 	= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_01a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_01b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_02 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_03 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_04a 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_04b 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_05 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_06 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_07 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	xm_lab_chairarm_02 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_08 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_09 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chair_10 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_chateau_chair_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_clown_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_cs_office_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_direct_chair_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_direct_chair_02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_gc_chair02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_04 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_04b 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_04_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_off_chair_05 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_old_deck_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_old_wood_chair 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_rock_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_skid_chair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_skid_chair_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_skid_chair_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_sol_chair 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_wheelchair_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_wheelchair_01_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_armchair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_clb_officechair_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_dinechair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_ilev_p_easychair_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_soloffchair_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_yacht_chair_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_club_officechair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_corp_bk_chair3 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_corp_cd_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_corp_offchair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_chair02_ped 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_hd_chair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_p_easychair 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ret_gc_chair03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_ld_farm_chair01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_04_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_05_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_06_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_leath_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_01_chr_a 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_01_chr_b 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_02_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_03b_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_table_03_chr 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_torture_ch_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_fh_dineeamesa 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },


	v_ilev_fh_kitchenstool 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_tort_stool 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },

	-- SEAT
	hei_prop_yah_seat_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	hei_prop_yah_seat_02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	hei_prop_yah_seat_03 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_waiting_seat_01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_yacht_seat_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_yacht_seat_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_yacht_seat_03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_hobo_seat_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.65, forwardOffset = 0.0, leftOffset = 0.0 },

	-- COUCH
	prop_rub_couch01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	miss_rub_couch_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_ld_farm_couch01 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_ld_farm_couch02 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_rub_couch02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_rub_couch03 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_rub_couch04 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },

	-- SOFA
	p_lev_sofa_s 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_res_sofa_l_s 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_v_med_p_sofa_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	p_yacht_sofa_01_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_ilev_m_sofa 				= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_res_tre_sofa_s 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_tre_sofa_mess_a_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_tre_sofa_mess_b_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	v_tre_sofa_mess_c_s 		= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },

	-- MISC
	prop_roller_car_01 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
	prop_roller_car_02 			= { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0 },
}