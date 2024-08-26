Config = {}

Config.Inventory = "qb-inventory"
Config.LaptopDevice = "laptop2"

Config.RenewedPhone = true

Config.Linux = true

Config.PoliceJobs = {
    "police",
    "bcso"
}

Config.Apps = {
    ['boosting'] = {
        app = 'boosting',
        name = 'Boosting',
        icon = 'fa-solid fa-fire-flame-curved',
        useimage = false,
        color = '#fff',
        background = '#FFB90F',
        job = {},                  -- Must be a table
        bannedJobs = { "police" }, -- Must be a table { 'police' }
        gang = {},                 -- Must be a table { 'ballas' }
        item = {},          -- Must be a table { 'vpn' }
        default = false            -- if true, it will be added by default, ignoring all the previously set parameters
    },
    ['setting'] = {
        app = 'setting',
        name = 'Setting',
        icon = 'fa-solid fa-cog',
        useimage = false,
        color = '#fff',
        background = "#4B5D67",
        job = {},
        bannedJobs = {},
        gang = {},
        item = {},
        default = true
    }
}
