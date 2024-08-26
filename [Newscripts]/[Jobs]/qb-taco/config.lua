Config = {}

Config.GaragePed = "u_m_m_bikehire_01"

Config.PedLocation = vector4(13.67, -1612.43, 28.40, 197.47)

Config.VehicleSpawn = vector4(16.02, -1613.69, 29.19, 139.89)

Config.Vehicle = 'taco'

HungerFill = {
}

ThirstFill = {
}

Config.Zones = {
    [1] = { coords = vector3(375.07196, -319.4749, 46.503387), radius = 1.35, icon = "fa-solid fa-box-open", event = "qb-shops:marketshop", label = "Ingredients", job = "taco" },
    -- [2] = { coords = vector3(16.2, -1597.67, 29.38), radius = 0.75, icon = "fa-solid fa-briefcase", event = "qb-bossmenu:client:OpenMenu", label = "Manage Business", job = {['taco'] = 2} },	
    -- [2] = { coords = vector3(387.27578, -311.817, 46.958793), radius = 0.8, icon = "far fa-clipboard", event = "jissuunnn-taco:client:frontTray1", label = "Counter", job = "taco" },
    [2] = { coords = vector3(384.86511, -310.7153, 46.594539), radius = 0.9, icon = "fa-solid fa-beer-mug-empty", event = "jissuunnn-taco:client:drinkStation", label = "Make Drinks", job = "taco" },  
    [3] = { coords = vector3(377.6683, -314.9836, 46.141479), radius = 0.9, icon = "fa-solid fa-beer-mug-empty", event = "jissuunnn-taco:client:cookStation", label = "Cook Food", job = "taco" },  
    -- [4] = { coords = vector3(387.20571, -311.7905, 45.824512), radius = 0.9, icon = "fa-solid fa-square-up-right", event = "qb-pawnj:table", label = "Storage", job = "taco" },
    [4] = { coords = vector3(380.45315, -311.281, 46.61594), radius = 0.6, icon = "fa-solid fa-clock", event = "Toggle:Duty", label = "Clock In/Out", job = "taco" },
    -- [8] = { coords = vector3(14.21, -1601.51, 29.19), radius = 0.5, icon = "fa-brands fa-cc-visa", event = "jissuunnn-taco:bill", label = "Bill Customer", job = "taco" },
}

Config.Items = {
label = "Shop",
    slots = 9,
    items = {
        [1] = {
            name = "tortillas",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "ground-beef",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cheddar-cheese",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "butter",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "chicken",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },       
		[6] = {
            name = "lettuce",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
		[7] = {
            name = "tortilla-chips",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
		[8] = {
            name = "carbonated-water",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
		[9] = {
            name = "sugar-cubes",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "taco-tomato",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "gelato",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
    }
}
