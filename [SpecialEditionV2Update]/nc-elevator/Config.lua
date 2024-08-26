
Config = {}

Config.WaitTime = 4000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.UseLanguage = "en" -- make new languages to your own likng

Config.UseSoundEffect = false -- makes a sound when you use elevator Note: still a work in progress

Config.Elevator = {
    [1] = {
        Sound = "LiftSoundBellRing",
        name = "Apartments", -- it should be different for each elevator you make
        locations = {
            vector3(-659.2011, -1111.356, 15.2),
            vector3(-655.7241, -1111.48, 22.0),
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-658.845, -1110.279, 15.063224, 60.813488),
            },
            [1] = {
                Coords = vector4(-655.6077, -1110.514, 21.834331, 68.611686),
            },
        }
    },
    [2] = {
        Sound = "LiftSoundBellRing",
        name = "VineWoodPolice", -- it should be different for each elevator you make
        locations = {
            vector3(614.03112, -13.07026, 83.019737),
            vector3(611.2611, -11.97273, 82.995719),
            vector3(611.2918, -12.14775, 87.274009),
            vector3(614.07141, -13.19764, 87.266593),
            vector3(612.53283, -17.43825, 91.774757)
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(614.30505, -14.78626, 82.763526, 335.74468),
            },
            [1] = {
                Coords = vector4(614.24542, -14.89499, 87.053642, 338.45019),
            },
            [2] = {
                Coords = vector4(612.80151, -19.37052, 91.537811, 340.91256),
            },
        }
    },
    [3] = {
        Sound = "LiftSoundBellRing",
        name = "VineWoodPolice", -- it should be different for each elevator you make
        locations = {
            vector3(325.53005, -582.9966, 28.949165),
            vector3(324.35723, -586.2165, 28.942974),
            vector3(333.68341, -592.7384, 43.481346),
            vector3(334.8822, -589.5051, 43.517532)
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(323.56011, -583.3692, 28.84822, 247.84439),
            },
            [1] = {
                Coords = vector4(335.74179, -592.4703, 43.268432, 73.033805),
            },
        }
    },
}





Config.Locals = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
}
