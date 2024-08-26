Config = {}

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["schotten"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.Locations = {
   ["duty"] = {[1] = vector3(440.085, -974.924, 30.689),
       --[1] = vector3(440.085, -974.924, 30.689),
       
   },
   ["vehicle"] = {
       --mrpd
       [1] = vector4(0, 0, 0, 0),
       --[[ [2] = vector4(445.43, -991.56, 25.35, 268.71), ]]
       --paleto
       --[[ [3] = vector4(-479.5, 6027.91, 30.99, 223.99), ]]
       --[4] = vector4(-472.4, 6035.29, 30.99, 221.96),
       --vbpd
       --[[ [5] = vector4(-1144.21, -847.28, 3.4, 36.09),
       [6] = vector4(-1117.63, -826.93, 3.4, 36.81), ]]
       --bcso
       [2] = vector4(0, 0, 0, 0),
       --[[ [8] = vector4(1882.29, 3691.63, 33.19, 30.62), ]]
       --parkrangers
       [3] = vector4(0, 0, 0, 0),
   },
   ["stash"] = {
       --[1] = vector3(453.075, -980.124, 30.889),
   },
   ["impound"] = {
        --mrpd
        [1] = vector4(0, 0, 0, 0),
        --paleto
        --[2] = vector4(-451.0, 5998.49, 30.99, 262.02),
        --vbpd
        --[3] = vector4(-1126.2, -815.55, 3.4, 214.28),
        --bcso
        [2] = vector4(0, 0, 0, 0),
   },
   ["helicopter"] = {
    [1] = vector4(449.13, -981.3, 43.69, 88.21),    --mrpd    
    [2] = vector4(-378.5039, -354.8529, 73.232574, 84.373344),     --rhpd
    [3] = vector4(1850.9108, 3685.9938, 41.505794, 105.1313),     --bcso
    [4] = vector4(405.14, -1641.12, 29.29, 16.93),     --davis
    [5] = vector4(-475.2, 5988.16, 31.72, 67.92),     --paleto
    [6] = vector4(-394.4092, -337.535, 73.232536, 327.43731),     --rhpd2
    [7] = vector4(3810.7849, 32.179042, 18.143856, 88.638771),     --ELKATRAZ
    [8] = vector4(602.06219, -28.65124, 92.100334, 249.80468), -- VPD
    -- [6] = vector4(3810.7849, 32.179042, 18.143856, 88.638771),     --ELKATRAZ2
},
   ["armory"] = {
      -- [1] = vector3(462.23, -981.12, 30.68),
   },
   ["trash"] = {
       [1] = vector3(594.61, 12.93, 76.63),   --mrpd
       --[2] = vector3(439.0907, -976.746, 30.776),   --paleto
       --[3] = vector3(-1081.22, -833.18, 13.52),     --vbpd
       [2] = vector3(1858.54, 3686.85, 29.82),      --bcso
   },
   ["fingerprint"] = {
      -- [1] = vector3(460.9667, -989.180, 24.92),
   },
   ["evidence"] = {
    [1] = vector3(483.74, -987.89, 30.69),   --mrpd
    --[2] = vector3(472.56, -993.81, 26.27),   --mrpd
    --[3] = vector3(472.59, -996.57, 26.27),   --mrpd
    --[4] = vector3(439.0907, -976.746, 30.776),   --paleto
    --[5] = vector3(-1099.39, -824.28, 19.3),      --vbpd
    [2] = vector3(1855.81, 3690.36, 29.82),     --bcso
    --[3] = vector3(1857.61, 3691.89, 29.82),     --bcso
    -- [3] = vector4(856.19, -1294.64, 28.24, 168.98)

   },
   ["stations"] = {
    [1] = {label = "Police Station - #1", coords = vector3(630.81597, -7.951877, 82.765464)},
    -- [2] = {label = "Prison", coords = vector4(1845.903, 2585.873, 45.672, 272.249)},
    [2] = {label = "Bolingbroke Prison", coords = vector4(1850.6649, 2585.7453, 45.67274, 246.72874)},
    [3] = {label = "Sandy PD", coords = vector4(1858.0351, 3679.9272, 33.795967, 73.854667)},
   },
}

Config.ArmoryWhitelist = {}

Config.Helicopter = "polas350"

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", coords = vector3(257.45, 210.07, 109.08), r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", coords = vector3(232.86, 221.46, 107.83), r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", coords = vector3(252.27, 225.52, 103.99), r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", coords = vector3(-53.1433, -1746.714, 31.546), r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", coords = vector3(-718.153, -909.211, 21.49), r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", coords = vector3(23.885, -1342.441, 31.672), r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", coords = vector3(1151.93, -320.389, 71.33), r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", coords = vector3(383.402, 328.915, 105.541), r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", coords = vector3(-1832.057, 789.389, 140.436), r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", coords = vector3(-3046.749, 592.491, 9.808), r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", coords = vector3(-3246.489, 1010.408, 14.705), r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", coords = vector3(539.773, 2664.904, 44.056), r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", coords = vector3(2673.579, 3281.265, 57.541), r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", coords = vector3(1966.24, 3749.545, 34.143), r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", coords = vector3(1729.522, 6419.87, 37.262), r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", coords = vector3(309.341, -281.439, 55.88), r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", coords = vector3(144.871, -1043.044, 31.017), r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", coords = vector3(-355.7643, -52.506, 50.746), r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", coords = vector3(-1214.226, -335.86, 39.515), r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", coords = vector3(-2958.885, 478.983, 17.406), r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", coords = vector3(-102.939, 6467.668, 33.424), r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", coords = vector3(-163.75, 6323.45, 33.424), r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Jewelery CAM#1", coords = vector3(-627.54, -239.74, 40.33), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Jewelery CAM#2", coords = vector3(-627.51, -229.51, 40.24), r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Jewelery CAM#3", coords = vector3(-620.3, -224.31, 40.23), r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Jewelery CAM#4", coords = vector3(-622.57, -236.3, 40.31), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    },
}

Config.AuthorizedVehicles = {
    [0] = {
        ["npolvic"] = "2005 Ford Crown Victoria",
    },
    [1] = {
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
    },
    [2] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
    },
    [3] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
    },
    [4] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
    },
    [5] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
    },
    [6] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
    },
    [7] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
        ["npolchal"] = "Dodge Challenger",
    },
    [8] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
        ["npolchal"] = "Dodge Challenger",
    },
    [9] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
        ["npolexp"] = "Ford Explorer",
        ["npolchal"] = "Dodge Challenger",
        ["npolvette"] = "Chevrolet Corvette",
    },
    [10] = {
        ["polraptor"] = "LSPD Raptor",
        ["npolvic"] = "2005 Ford Crown Victoria",
        ["poltah"] = "2020 Chevrolet Tahoe",
        ["poltaurus"] = "2015 Ford Taurus",
        ["polchar"] = "2015 Dodge Charger",
        ["npolstang"] = "2019 Ford Mustang",
        ["npolexp"] = "Ford Explorer",
        ["npolchal"] = "Dodge Challenger",
        ["npolvette"] = "Chevrolet Corvette",
    },
}

Config.WhitelistedVehicles = {}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Large caliber bullet",
}

Config.Radars = {
	vector4(-623.44421386719, -823.08361816406, 25.25704574585, 145.0),
	vector4(-652.44421386719, -854.08361816406, 24.55704574585, 325.0),
	vector4(1623.0114746094, 1068.9924316406, 80.903594970703, 84.0),
	vector4(-2604.8994140625, 2996.3391113281, 27.528566360474, 175.0),
	vector4(2136.65234375, -591.81469726563, 94.272926330566, 318.0),
	vector4(2117.5764160156, -558.51013183594, 95.683128356934, 158.0),
	vector4(406.89505004883, -969.06286621094, 29.436267852783, 33.0),
	vector4(657.315, -218.819, 44.06, 320.0),
	vector4(2118.287, 6040.027, 50.928, 172.0),
	vector4(-106.304, -1127.5530, 30.778, 230.0),
	vector4(-823.3688, -1146.980, 8.0, 300.0),
}

Config.CarItems = {
    [1] = {
        name = "empty_evidence_bag",
        amount = 10,
        info = {},
        type = "item",
        slot = 2,
    },
    [2] = {
        name = "police_stormram",
        amount = 1,
        info = {},
        type = "item",
        slot = 3,
    },
}

Config.Items = {
    label = "Police Armory",
    slots = 31,
    items = {
        [1] = {
            name = "weapon_taser",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [2] = {
            name = "weapon_nightstick",
            price = 5,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [3] = {
            name = "weapon_flashlight",
            price = 5,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [4] = {
            name = "weapon_fn57",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 4,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [5] = {
            name = "weapon_glock",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 5,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [6] = {
            name = "weapon_ltl",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 6,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [7] = {
            name = "weapon_m4",
            price = 0,
            amount = 1,
            info = {
                serie = ""
            },
            type = "weapon",
            slot = 7,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [8] = {
            name = "weapon_flashbang",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 8,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [9] = {
            name = "weapon_combatpdw",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [10] = {
            name = "weapon_specialcarbine_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "item",
            slot = 10,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [11] = {
            name = "ifak",
            price = 10,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [12] = {
            name = "pistol_ammo",
            price = 5,
            amount = 99,
            info = {},
            type = "item",
            slot = 12,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [13] = {
            name = "shotgun_ammo",
            price = 5,
            amount = 99,
            info = {},
            type = "item",
            slot = 13,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [14] = {
            name = "smg_ammo",
            price = 5,
            amount = 99,
            info = {},
            type = "item",
            slot = 14,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [15] = {
            name = "rifle_ammo",
            price = 5,
            amount = 99,
            info = {},
            type = "weapon",
            slot = 15,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [16] = {
            name = "police_stormram",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
            authorizedJobGrades = {4, 9, 13, 14, 15, 16, 18, 19, 20, 21, 22, 24, 26, 28, 29, 38, 30, 32, 33, 34, 35, 36, 37, 38}
        },
        [17] = {
            name = "radio",
            price = 15,
            amount = 5,
            info = {},
            type = "item",
            slot = 17,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [18] = {
            name = "heavyarmor",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [19] = {
            name = "parachute",
            price = 20,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 19,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [20] = {
            name = "nightvision",
            price = 20,
            amount = 1,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [21] = {
            name = "adrenaline",
            price = 10,
            amount = 20,
            info = {},
            type = "item",
            slot = 21,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [22] = {
            name = "uconnectair",
            price = 5,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [23] = {
            name = "diving_gear",
            price = 20,
            amount = 3,
            info = {},
            type = "item",
            slot = 23,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [24] = {
            name = "ifak",
            price = 20,
            amount = 15,
            info = {},
            type = "item",
            slot = 24,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [25] = {
            name = "binoculars",
            price = 5,
            amount = 3,
            info = {},
            type = "item",
            slot = 25,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [26] = {
            name = "handcuffs",
            price = 5,
            amount = 5,
            info = {},
            type = "item",
            slot = 27,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [28] = {
            name = "signalradar",
            price = 1,
            amount = 5,
            info = {},
            type = "item",
            slot = 27,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [29] = {
            name = "weapon_smg",
            price = 50,
            amount = 1,
            info = {},
            type = "item",
            slot = 28,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [30] = {
            name = "weapon_microsmg",
            price = 25,
            amount = 1,
            info = {},
            type = "item",
            slot = 29,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [31] = {
            name = "vehicle_tablet",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 32,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [32] = {
            name = "vehicle_gps",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 31,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [33] = {
            name = "drone",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [34] = {
            name = "screwdriverset",
            price = 20,
            amount = 1,
            info = {},
            type = "item",
            slot = 33,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [35] = {
            name = "lockpick",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 34,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [36] = {
            name = "pdbadge",
            price = 5,
            amount = 1,
            info = {},
            type = "item",
            slot = 35,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [37] = {
            name = "chattablet",
            price = 5,
            amount = 1,
            info = {},
            type = "item",
            slot = 36,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [38] = {
            name = "handcuffs",
            price = 5,
            amount = 1,
            info = {},
            type = "item",
            slot = 37,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [39] = {
            name = "police_stormram",
            price = 5,
            amount = 1,
            info = {},
            type = "item",
            slot = 38,
            authorizedJobGrades = {21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [40] = {
            name = "policespikes",
            price = 10,
            amount = 5,
            info = {},
            type = "item",
            slot = 40,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [41] = {
            name = "taserammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 41,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [42] = {
            name = "notepad",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 42,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [43] = {
            name = "pddetcord",
            price = 600,
            amount = 1,
            info = {},
            type = "item",
            slot = 43,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
        [44] = {
            name = "WEAPON_SMOK2GRENADE",
            price = 300,
            amount = 1,
            info = {},
            type = "item",
            slot = 44,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 38, 30, 31,  32, 33, 34}
        },
    }
}

Config.CItems = {
    label = "Corrections Armory",
    slots = 1,
    items = {
        [1] = {
            name = "weapon_ltl",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [2] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        }
    }
}

Config.VehicleSettings = {
    ["car1"] = { --- Model name
        ["extras"] = {
            ["1"] = true, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        }
    },
    ["car2"] = {
        ["extras"] = {
            ["1"] = true,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        }
    }
}

-----------------Priority----------
Config.JD_logs = false
Config.JD_logsChannel = "priority"
Config.JD_logsColor = "#F1F1F1"
Config.Color = "~c~"

-- Ace perm needed for staff commands
-- Config.AcePerm = "jd.staff"

-- Default cooldown time
Config.CooldownTime = 15
Config.DisplaySeconds = true

-- Location for the Priorty Status Display
Config.DisplayX = 0.179
Config.DisplayY = 0.965