

Config = {
	Debug = false, -- Set to true to show target locations
	Locations = {
		{ -- CLUB77
			job = "vanilla", -- Set this to required job role
			enableBooth = true, -- option to disable rather than deleting code
			DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
			radius = 30, -- The radius of the sound from the booth
			coords = vector3(247.37496, -3187.041, 0.571497), -- Where the booth is located
		},
		{ -- BurgerShot (smokeys MLO coords)
			job = "burgershot",
			enableBooth = true,
			DefaultVolume = 0.2,
			radius = 20,
			coords = vector3(90.133102, 280.31585, 109.31568),
		},
		{ -- COOLBEANS (smokeys MLO coords)
		job = "coolbeans",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 20,
		coords = vector3(-1196.625, -1132.573, 7.0583295),
	},
		{ -- BurgerShot (smokeys MLO coords)
		job = "casino",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 70,
		coords = vector3(1092.1923, -2327.103, 24.496957),
	},
	-- 	{ -- RODEO
	-- 	job = "rodeo",
	-- 	enableBooth = true,
	-- 	DefaultVolume = 0.2,
	-- 	radius = 20,
	-- 	coords = vector3(-1517.635, -1312.155, 2.1729907),
	-- },
		{ -- Pawn (smokeys MLO coords)
		job = "pawn",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 20,
		coords = vector3(-316.3758, -93.69367, 47.38758),
	},
	{ -- mechanic (smokeys MLO coords)
	job = "mechanic",
	enableBooth = true,
	DefaultVolume = 0.2,
	radius = 20,
	coords = vector3(-1607.606, -833.5972, 9.7342157),
},
		{ -- 
		job = "whitewidow",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 40,
		coords = vector3(192.23046, -235.4703, 53.745346),
		},
		{ -- 
		job = "beanmachine",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 40,
		coords = vector3(322.94985, -891.5856, 59.576568),
		},
		{ -- 
		job = "catcafe",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 40,
		coords = vector3(-581.8519, -1058.473, 21.622394),
		},
		{ -- 
		job = "yellowjack",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 40,
		coords = vector3(1981.4899, 3050.6357, 47.309246),
		},
		{ -- LostMC compound next to Casino
			gang = "lostmc",
			enableBooth = true,
			DefaultVolume = 0.1,
			radius = 20,
			coords = vector3(983.14, -133.17, 79.59),
			soundLoc = vector3(988.79, -131.62, 78.89), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		{ -- 
		job = "taco",
		enableBooth = true,
		DefaultVolume = 0.2,
		radius = 40,
		coords = vector3(390.33773, -312.3487, 46.587268),
		},
		{ -- LostMC compound next to Casino
			gang = "lostmc",
			enableBooth = true,
			DefaultVolume = 0.1,
			radius = 20,
			coords = vector3(983.14, -133.17, 79.59),
			soundLoc = vector3(988.79, -131.62, 78.89), -- Add sound origin location if you don't want the music to play from the dj booth
		},
	},
}
