Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 40.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
				--  BEAR
				-- {
				-- 	model = `BrnBear`,
				-- 	coords = vector4(318.96411, -990.1903, 29.32533, 210.10888),
				-- 	gender = 'male'
				-- },
								--  casino chips
								--[[ {
									model = `csb_tomcasino`,
									coords = vector4(249.24603, -3151.039, 3.3248796, 187.10084),
									gender = 'male'
								}, ]]
				--  casino shop
				{
					model = `csb_tomcasino`,
					coords = vector4(1104.3609, -2309.236, 24.456476, 171.28816),
					gender = 'male'
				},
			{
		model = `s_m_m_bouncer_01`, 
		coords = vector4(1071.9514, -2312.615, 24.453638, 39.607746),
		gender = 'male', 
		animDict = 'abigail_mcs_1_concat-0', 
		anim = 'csb_abigail_dual-0', 
		flag = 1, 
		scenario = 'WORLD_HUMAN_GUARD_STAND', 
		minusOne = true,
		freeze = true,
		invincible = true,
	},
	--  BurgerShot Car
	{
		model = `u_m_m_partytarget`,
		coords = vector4(-3226.723, 1245.681, 3.5797021, 227.25683),
		gender = 'male'
	},
		--  police impound 
	{
		model = `s_m_y_cop_01`,
		coords = vector4(-363.9678, -363.4045, 24.756458, 86.286277),
		gender = 'male'
	},
	-- 	--  pawn
	-- 	{
	-- 		model = `cs_movpremmale`,
	-- 		coords = vector4(-318.4634, -96.03404, 47.047386, 158.88899),
	-- 		gender = 'male'
	-- 	},
	-- --  Pokemon
	-- {
	-- 	model = `ig_molly`,
	-- 	coords = vector4(-319.7925, -101.6672, 47.047325, 338.73968),
	-- 	gender = 'male'
	-- },
	-- Weapon Reapir
		{
			model = `ig_maude`,
			coords = vector4(-440.7987, 1598.8071, 358.4682, 323.89123),
			gender = 'male'
		},
		-- Weapon Reapir #2
		{
			model = `ig_maude`,
			coords = vector4(268.10916, 2862.2385, 65.968933, 210.36972),
			gender = 'male'
		},
	-- Flight School NPC'S --
	{
		model = `s_m_y_pilot_01`, 
		coords = vector4(-906.4953, -2977.888, 13.997162, 151.64909),
		gender = 'male', 
	},
	--  Phone Store
	{
		model = `ig_bestmen`,
		coords = vector4(-1531.444, -403.4486, 35.635272, 226.91539),
		gender = 'male'
	},
	--  Black Market
	{
		model = `ig_manuel`,
		coords = vector4(-565.1647, 236.48388, 74.890899, 119.68236),
		gender = 'male'
	},
		-- --  Old Weapon Attach shop
		-- {
		-- 	model = `ig_manuel`,
		-- 	coords = vector4(2340.2968, 3058.2839, 48.151893, 173.88352),
		-- 	gender = 'male'
		-- },
	-- Joseph Drug Proccess
	{
		model = `cs_taostranslator`,
		coords = vector4(-577.4434, 230.79742, 74.990853, 31.135957),
		gender = 'male'
	},
		-- NIKI BLACKMARKET VPN Proccess BOOSTING VPN
		{
			model = `a_m_m_soucent_04`,
			coords = vector4(-570.3253, 232.99697, 74.890838, 15.911506),
			gender = 'male'
		},
				-- SELL CRYPTO PAPERS
				{
					model = `cs_martinmadrazo`,
					coords = vector4(-568.8316, 227.72392, 74.890846, 359.00689),
					gender = 'male'
				},
			-- police elevator 
			{
				model = `csb_cop`,
				coords = vector4(-404.4564, -347.4963, 70.96508, 309.47378),
				gender = 'male'
			},
		-- boat shop
		{
			model = `a_m_y_surfer_01`,
			coords = vector4(396.92385, -1178.915, 29.397914, 359.41342),
			gender = 'female'
		},
		-- VEHICLE SHOP
		{
			model = `ig_milton`,
			coords = vector4(-63.62717, 74.152008, 71.873275, 147.72775),
			gender = 'male'
		},

			--  PRISON JAIL UNJAIL
			{
				model = `csb_prolsec`,
				coords = vector4(1777.306, 2494.1826, 50.427352, 64.084518),
				gender = 'male'
			},
						--  JAIL FOOD
						{
							model = `s_m_m_migrant_01`,
							coords = vector4(3920.7722, 30.501314, 23.887844, 258.36206),
							gender = 'male'
						},
												--  POLICE FOOD
												{
													model = `s_m_m_migrant_01`,
													coords = vector4(1780.7615, 2560.8288, 45.673137, 178.38806),
													gender = 'male'
												},
	{
		model = `ig_omega`,
		coords = vector4(1851.97, 2581.72, 45.71, 271.52),
		gender = 'male'
	},
	{
		model = `s_m_m_migrant_01`,
		coords = vector4(-374.3997, -349.1192, 43.595195, 174.38987),
		gender = 'male'
	},
	-- Fish Sales
	{
		model = `ig_chef`,   
		coords = vector4(-1850.34, -1239.56, 8.62, 141.22), 
 		gender = 'male'
	},

	-- Recycle Trader
	-- {
	-- 	model = `ig_omega`,   
	-- 	coords = vector4(-421.3196, -1697.722, 19.042461, 65.208534),  
 	-- 	gender = 'male', 
	-- 	scenario = "WORLD_HUMAN_STAND_MOBILE"
	-- },

	-- {
	-- 	model = `hc_hacker`,
	-- 	coords = vector4(517.44, 174.29, 100.25, 158.45),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `g_f_y_vagos_01`,
	-- 	coords = vector4(-458.65, -2274.4, 8.52, 266.45),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `ig_talcc`,
	-- 	coords = vector4(1579.43, 3617.83, 38.78, 166.87),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `s_f_y_clubbar_01`,
	-- 	coords = vector4(-1600.27, 3070.47, 33.66, 137.83),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `g_f_importexport_01`,
	-- 	coords = vector4(-3169.54, 1093.57, 20.86, 27.67),
	-- 	gender = 'female'
	-- },

    --------- Shops -----------
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(24.75, -1348.48, 29.5, 264.84),
		gender = 'male'
	},

	-- -- Legion
	-- {
	-- 	model = `mp_m_shopkeep_01`,
	-- 	coords = vector4(203.45671, -866.2792, 29.718721, 116.32729),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `mp_m_shopkeep_01`,
	-- 	coords = vector4(239.6777, -897.3067, 29.623245, 157.81025),
	-- 	gender = 'male'
	-- },

	-- {
	-- 	model = `mp_m_shopkeep_01`,
	-- 	coords = vector4(-2592.77, 1878.57, 175.56, 221.29),
	-- 	gender = 'male'
	-- },
	
	-- {
	-- 	model = `mp_m_shopkeep_01`,
	-- 	coords = vector4(225.65, -909.83, 30.73, 351.32),
	-- 	gender = 'male'
	-- },
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-47.4, -1758.65, 29.42, 47.22),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-706.16, -914.51, 19.22, 96.95),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1221.97, -908.32, 12.33, 32.06),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1134.21, -982.49, 46.42, 277.1),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1164.81, -323.63, 69.21, 97.58),
		gender = 'male'
	},
	{
		model = `a_m_y_hippy_01`,
		coords = vector4(-1486.19, -377.99, 40.16, 128.18),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(372.69, 325.21, 103.61, 249.92),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3241.12, 1000.28, 12.84, 355.12),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2558.32, 381.2, 108.62, 354.01),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(548.53, 2672.29, 42.16, 102.04),
		gender = 'male'
	},
	{
		model = `a_m_y_hippy_01`,
		coords = vector4(1165.92, 2710.77, 38.16, 175.89),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1961.01, 3739.28, 32.34, 299.01),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.41, 4923.4, 42.06, 325.06),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1727.72, 6414.09, 35.04, 249.1),
		gender = 'male'
	},
	-- {
	-- 	model = `mp_m_shopkeep_01`,
	-- 	coords = vector4(-156.21, 6327.13, 31.58, 317.09),
	-- 	gender = 'male'
	-- },
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(160.06, 6640.66, 31.7, 230.76),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(324.67984, -583.8979, 43.270233, 164.59237),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1819.504, 793.4591, 138.08605, 131.72781),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3038.926, 584.50714, 7.9089374, 14.645492),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-2966.301, 390.86804, 15.043318, 84.431518),
		gender = 'male'
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2677.9982, 3279.4628, 55.241111, 329.8406),
		gender = 'male'
	},
	----------- Smoke on the water --------
	 {
		model = `a_f_m_business_02`,
		coords = vector4(-1171.29, -1571.1, 4.66, 124.95),
		gender = 'female'
	},
	----------- BeeKeeping Store --------
		{
			model = `g_m_m_chemwork_01`,
			coords = vector4(1532.1087, 1728.1524, 109.91768, 97.558891),
			gender = 'male'
		}, 
	----------- Pet Store --------
	-- {
	-- 	model = `a_f_y_vinewood_01`,
	-- 	coords = vector4(-1366.137, 58.309696, 54.098438, 97.306823),
	-- 	gender = 'female'
	-- },
	----------- Police Garage --------
	{
		model = `u_m_y_smugmech_01`,
		coords = vector4(542.17407, 5.670783, 69.511169, 38.514141),
		gender = 'male'
	},
	----------- Sea World --------
	{
		model = `a_m_y_epsilon_01`,
		coords = vector4(-1686.34, -1072.61, 13.15, 50.74),
		gender = 'male'
	},
	----------- PayCheck --------
	{
		model = `a_f_y_femaleagent`,
		coords = vector4(-1310.24, -821.96, 17.15, 220.1),
		gender = 'female'
	},
	
    -- ---------- Garages ----------
	-- ----qb-core Garages
	-- {
	-- 	model = `a_m_o_soucent_03`,
	-- 	coords = vector4(-292.97, -986.47, 31.18, 62.78),
	-- 	gender = 'male'
	-- },
	-- ------Casino Garages
	-- {
	-- 	model = `a_m_o_soucent_03`,
	-- 	coords = vector4(886.76, 0.22, 78.77, 146.4),
	-- 	gender = 'male'
	-- },
	------Rental Place
	-- {
	-- 	model = `s_m_y_armymech_01`,
	-- 	coords = vector4(3847.9584, -42.63887, 5.5576372, 183.07035),
	-- 	gender = 'male'
	-- },
		------Rental BOAT
		{
			model = `s_m_y_armymech_01`,
			coords = vector4(-1248.394, -1843.351, 1.9554623, 307.01275),
			gender = 'male'
		},
		-- ------Rental PRISON
		-- {
		-- 	model = `a_m_y_business_02`,
		-- 	coords = vector4(-211.26, -1001.92, 29.3, 67.79),
		-- 	gender = 'male'
		-- },
				------Rental PRISON
				-- {
				-- 	model = `a_m_y_business_02`,
				-- 	coords = vector4(2857.2092, 213.141, 2.8306007, 226.21162),
				-- 	gender = 'male'
				-- },
				-- 				------CHECKIN PRISON
				-- 				{
				-- 					model = `a_m_y_business_02`,
				-- 					coords = vector4(1769.84, 2571.7482, 45.729892, 124.45985),
				-- 					gender = 'male'
				-- 				},
		-- ------Rental OTTOS
		-- {
		-- 	model = `a_m_y_business_02`,
		-- 	coords = vector4(-1411.11, -432.91, 36.23, 34.22),
		-- 	gender = 'male'
		-- },
	-- -----Airport Garage
	-- {
	-- 	model = `a_m_o_soucent_03`,
	-- 	coords = vector4(-794.62, -2024.23, 8.99, 236.79),
	-- 	gender = 'male'
	-- },
	-- -----Sandy Garage
	-- {
	-- 	model = `a_m_o_soucent_03`,
	-- 	coords = vector4(1729.25, 3706.88, 34.13, 19.52),
	-- 	gender = 'male'
	-- },
	-- -----Savar Garage
	-- {
	-- 	model = `a_m_o_soucent_03`,
	-- 	coords = vector4(84.42, 6421.25, 31.58, 322.2),
	-- 	gender = 'male'
	-- },
	-- -----------------/ sandysheriff

	-- {
	-- 	model = `cs_siemonyetarian`, 
	-- 	coords = vector4(261.23574, -1004.961, 61.635578, 148.95137),
	-- 	gender = 'male', 
	-- 	animDict = 'abigail_mcs_1_concat-0', 
	-- 	anim = 'csb_abigail_dual-0', 
	-- 	flag = 1, 
	-- 	scenario = 'WORLD_HUMAN_AA_SMOKE', 
	-- 	minusOne = true,
	-- 	freeze = true,
	-- 	invincible = true,
	-- },
	--  ---------- Depot ----------
	-- {
	-- 	model = `ig_sacha`,
	-- 	coords = vector4(-193.33, -1162.36, 23.67, 269.45),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `ig_sacha`,
	-- 	coords = vector4(1894.45, 3715.1, 32.76, 123.05),
	-- 	gender = 'male'
	-- },
	-- {
	-- 	model = `ig_sacha`,
	-- 	coords = vector4(-220.23, 6197.9, 31.49, 312.97),
	-- 	gender = 'male'
	-- },
	 ---------- Hospital ----------
	{
		model = `mp_f_meth_01`,
		coords = vector4(310.75662, -585.329, 43.26757, 61.761219),
		gender = 'female'
	},
	---------- car wash ----------
	{
		model = `cs_old_man2`,
		coords = vector4(25.24, -1389.36, 29.36, 188.12),
		gender = 'male'
	},
	{
		model = `cs_old_man2`,
		coords = vector4(174.76, -1739.65, 29.29, 10.6),
		gender = 'male'
	},
	{
		model = `cs_old_man2`,
		coords = vector4(-702.39, -933.13, 19.01, 271.23),
		gender = 'male'
	},
	{
		model = `cs_old_man2`,
		coords = vector4(1361.23, 3595.51, 34.91, 203.78),
		gender = 'male'
	},
	{
		model = `cs_old_man2`,
		coords = vector4(-94.67, 6398.68, 31.49, 137.75),
		gender = 'male'
	},

	---------- Gun Shop ---------
	-- {
	-- 		model = `s_m_y_ammucity_01`, 
	-- 		coords = vector4(23.015813, -1105.653, 29.797002, 159.2552),
	-- 		gender = 'male', 
	-- },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(23.015813, -1105.653, 29.797002, 159.2552),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(-1118.937, 2699.7373, 18.554119, 235.0541),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(253.89549, -50.43577, 69.941024, 71.318237),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(841.09, -1028.66, 28.19, 267.54),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(-662.355, -933.4842, 21.82921, 173.08567),
		gender = 'male', 
    },
	-- {
	-- 	model = `s_m_y_ammucity_01`, 
	-- 	coords = vector4(-662.56, -933.57, 21.83, 182.83),
	-- 	gender = 'male', 
    -- },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(842.47369, -1035.462, 28.194881, 355.25979),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(1691.9367, 3760.9157, 34.705284, 222.80128),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(-331.8597, 6084.788, 31.454761, 232.53073),
		gender = 'male', 
    },
	{
		model = `s_m_y_ammucity_01`, 
		coords = vector4(810.13598, -2159.07, 29.618984, 11.232694),
		gender = 'male', 
    },
	------------- hardwere store ---------
	 {
		model = `csb_money`, 
		coords = vector4(46.73, -1749.73, 29.63, 52.27),
		gender = 'male', 
    },
	{
		model = `csb_money`, 
		coords = vector4(2747.29, 3473.07, 55.67, 250.46),
		gender = 'male', 
    },
	{
		model = `csb_money`, 
		coords = vector4(-421.94, 6136.67, 31.88, 176.82),
		gender = 'male', 
    },
		------------- mining ---------
		{
			model = `a_m_y_cyclist_01`, 
			coords = vector4(1077.74, -1984.72, 30.9, 233.35),
			gender = 'male', 
		},
		{
			model = `a_m_y_musclbeac_02`, 
			coords = vector4(1110.9, -2007.7, 31.04, 26.61),
			gender = 'male', 
		},
		{
			model = `a_m_y_vinewood_04`, 
			coords = vector4(1108.72, -1993.5, 30.97, 145.75),
			gender = 'male', 
		},
		------------- Black Market Crafting ---------
		-- {
		-- 	model = `mp_m_bogdangoon`, 
		-- 	coords = vector4(-534.53, -2216.01, 6.39, 220.99),
		-- 	gender = 'male', 
		-- },
		-- 	------------- attachmant Crafting ---------
		-- 	{
		-- 		model = `csb_mweather`, 
		-- 		coords = vector4(-39.39, -614.43, 35.27, 243.92),
		-- 		gender = 'male', 
		-- 	},
		------------- Ems Check In ---------
		{
			model = `s_f_y_scrubs_01`, 
			coords = vector4(310.94793, -585.9857, 43.267623, 162.56805),
			gender = 'female', 
		},
		-- police check in
		{
			model = `s_f_y_scrubs_01`, 
			coords = vector4(474.54693, -1007.318, 26.273466, 174.41806),
			gender = 'female', 
		},
				-- sandy check in
				{
					model = `s_f_y_scrubs_01`, 
					coords = vector4(1832.739, 3682.5397, 34.189266, 110.68903),
					gender = 'female', 
				},
			----------- police bennys ---------
			{
				model = `mp_m_counterfeit_01`, 
				coords = vector4(1882.6596, 3701.4758, 33.541908, 122.35897),
				gender = 'male', 
			},
						----------- police VPD bennys ---------
						{
							model = `mp_m_counterfeit_01`, 
							coords = vector4(546.01281, 9.0272827, 69.510948, 34.551071),
							gender = 'male', 
						},
						----------- police benny2s ---------
						{
							model = `mp_m_counterfeit_01`, 
							coords = vector4(451.46475, -973.9951, 25.699989, 168.08558),
							gender = 'male', 
						},
			-- ------------- SandyPD bennys ---------
			-- {
			-- 	model = `mp_m_counterfeit_01`, 
			-- 	coords = vector4(1837.3291, 3703.3901, 33.974639, 216.58187),
			-- 	gender = 'male', 
			-- },
	---------------DigitalDel
	-- {
    --     model = `ig_lifeinvad_01`,
    --     coords = vector4(149.08, -234.68, 54.42, 337.93),
    --     gender = 'male', 
    -- },
	-------------Repair
	-- {
    --     model = `a_m_m_hillbilly_01`,
    --     coords = vector4(-180.71, -1282.51, 31.29, 94.5),    fishing job in city 
    --     gender = 'male', 
    -- },
	------Delivery
	{
		model = `a_m_y_business_01`,
		coords = vector4(474.78, -1457.01, 29.29, 6.66),
		gender = 'male'
	},
	------------Emnei
	-- {
    --     model = `a_c_chimp`,
    --     coords = vector4(1088.97, -2003.65, 31.14, 326.61),
    --     gender = 'male', 
    -- },
	{
        model = `csb_trafficwarden`,
        coords = vector4(-842.7686, -1236.248, 6.9339318, 325.89291),
        gender = 'male', 
    },
	{
        model = `ig_hunter`,
        coords = vector4(-679.5017, 5839.3217, 17.331445, 223.66967),
        gender = 'male', 
    },

}