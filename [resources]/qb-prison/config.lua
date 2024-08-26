Config = {}

Config.Jobs = {
    ["electrician"] = "Electrician",
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = {x = 1750.73, y = 2542.283, z = 45.55281, h = 29.642},
            },
            [2] = {
                coords = {x = 1766.843, y = 2531.47, z = 45.55281, h = 201.238},
            },
            [3] = {
                coords = {x = 1714.605, y = 2532.445, z = 45.5528, h = 41.767},
            },
            -- [4] = {
            --     coords = {x = 1664.827, y = 2501.58, z = 45.56, h = 272.249},
            -- },
            -- [5] = {
            --     coords = {x = 1621.622, y = 2509.302, z = 45.56, h = 272.249},
            -- },
            -- [6] = {
            --     coords = {x = 1627.936, y = 2538.393, z = 45.56, h = 272.249},
            -- },
            -- [7] = {
            --     coords = {x = 1625.1, y = 2575.988, z = 45.56, h = 272.249},
            -- },
        },
    },
    ["outside"] = {
        coords = { ['x'] = 1852.3969, ['y'] = 2585.9147, ['z'] = 45.67274, ['h'] = 270.29086 },  
    },
    ["yard"] = {
        coords = {x = 3893.652, y = 26.41, z = 23.89, h = 1.0, r = 1.0},  
    },
    --[[["middle"] = {
        coords = {x = 1855.44, y = 2609.56, z = 45.67, h = 1.0},
    },]]--
    ["shop"] = {
        -- coords = {x = 1781.54, y = 2557.46, z = 45.67, h = 1.0, r = 1.0},
    },
    ["freedom"] = {
        coords = {x = 1670.9633, y =  2552.8859, z = 45.564895},
    },
    spawns = {
        { ['x'] = 1768.4771, ['y'] = 2484.1621, ['z'] = 50.422798, ['h'] = 24.834095 },
        { ['x'] = 1771.5229, ['y'] = 2492.2294, ['z'] = 50.425937, ['h'] = 126.0575 },
        { ['x'] = 1759.2784, ['y'] = 2493.2031, ['z'] = 50.424785, ['h'] = 202.25132 },
        { ['x'] = 1763.7376, ['y'] = 2491.0546, ['z'] = 45.819675, ['h'] = 282.06671 },
    }
}

Config.Zones = {
    ['prison'] = {
        ['points'] = {
            vector2(1493.810, 2642.6081),
            vector2(1812.463, 2937.93),
            vector2(2078.49, 2646.00),
            vector2(1877.17, 2222.415)
        },
        ['options'] = {}
    },
    ['prison:checks'] = {
        ['points'] = {
            vector2(1493.810, 2642.6081),
            vector2(1812.463, 2937.93),
            vector2(2078.49, 2646.00),
            vector2(1877.17, 2222.415)
        }, 
        ['options'] = {
            class = "prison",
            minZ = 44.5,
            maxZ = 52.0,
        },
        ['data'] = {
            ['condition'] = function()
                return Stats()
            end,
            ['options'] = {
                {
                    ['icon'] = "fas fa-hourglass-half",
                    ['next'] = function()
                        local inJail, jailTime = Stats()
                        return jailTime > 0 and "Check Time" or "Leave Prison"
                    end,
                    ['event'] = 'prison:client:Leave'
                }
            }
        }
    },
}

Config.CanteenItems = {
    [1] = {
        name = "jailfood",
        price = 10,
        amount = 200,
        info = {},
        type = "item",
        slot = 1,
    },
}