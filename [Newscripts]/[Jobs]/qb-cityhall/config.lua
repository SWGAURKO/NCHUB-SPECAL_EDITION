QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.RenewedPhone = false --> Set to true if you are using Renewed scripts their qb-phone

-- Ped spawner
Config.ped = {
    enabled = true,
    model = "a_m_m_indian_01",
    coords = vector4(-544.2397, -205.5507, 37.0, 213.29185),
    label = "Open cityhall"
}

Config.blip = {
    enabled = true,
    Name = "City Hall",
    SpriteId = 487,
    Color = 2,
    Scale = 0.7,
    ShortRange = true,
    Alpha = 255,
    Coords = vector3(-555.9575, -185.6542, 38.221076)
}

-- Jobs for hire
Config.jobs = {
    -- {
    --     job = "police",
    --     label = "Police",
    -- },
    {
        job = "taxi",
        label = "Taxi",
    },
    {
        job = "unemployed",
        label = "Freelancer",
    },
    -- {
    --     job = "catcafe",
    --     label = "CatCafe",
    -- },
}

-- Items for purchase
Config.items = {{
    item = "id_card",
    meta = 'id',
    label = "ID Card",
    price = 100
}, {
    item = "driver_license",
    label = "Driver License",
    meta = 'driver',
    price = 100
}, {
    item = "weaponlicense",
    label = "Weapon License",
    meta = 'weapon',
    price = 100
}}

-- Items shown in the information tab
Config.licenseItems = {{
    item = 'id_card',
    label = 'ID Card'
}, {
    item = 'driver_license',
    label = 'Driver License'
}, {
    item = 'weaponlicense',
    label = 'Weapon License'
}}
