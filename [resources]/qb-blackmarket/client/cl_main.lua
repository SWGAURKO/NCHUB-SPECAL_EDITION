QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

-- BEE

RegisterNetEvent('qb-beekeeping:hmenu')
AddEventHandler('qb-beekeeping:hmenu', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "BeeKeepingMarket",
            txt = "", 
        },
        {
			id = 3,
            header = "Sell BeeKeeping Items",
			txt = "Sell BeeKeeping Items",
			params = {
                event = "qb-beekeeping:sbuy",
            }
        },
        {
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
-- else
--     QBCore.Functions.Notify("I'm not dealing with anyone at the moment, come back later", 'error')
--     end
end)



RegisterNetEvent('qb-blackmarket:hmenu')
AddEventHandler('qb-blackmarket:hmenu', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Market",
            txt = "", 
        },
        {
			id = 3,
            header = "Sell Your Sh*t",
			txt = "Sell Items From Robberies",
			params = {
                event = "qb-blackmarket:sbuy",
            }
        },
        {
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
-- else
--     QBCore.Functions.Notify("I'm not dealing with anyone at the moment, come back later", 'error')
--     end
end)

-- BLACKMARKET 

exports["qb-target"]:AddCircleZone("blackmarkettarget", vector3(-565.1647, 236.48388, 74.890899), 0.6,
    {
        name = "blackmarkettarget",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-blackmarket:hmenu",
                icon = "fas fa-circle",
                label = "Talk With The BlackMarket Seller",
            },
        },
        distance = 1.5
    }
)

--

exports["qb-target"]:AddCircleZone("cafeout", vector3(-586.3296, -1049.729, 22.603803), 0.6,
    {
        name = "cafeout",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-ccafe:interact:stash",
                icon = "fas fa-circle",
                label = "Open Personal Locker",
                job = "catcafe",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("yellowjackeout", vector3(1983.1917, 3049.3525, 46.885314), 0.6,
    {
        name = "yellowjackeout",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-yellowjack:interact:stash",
                icon = "fas fa-circle",
                label = "Open Personal Locker",
                job = "yellowjack",
            },
        },
        distance = 1.5
    }
)

-- yellow jack tray 

exports["qb-target"]:AddCircleZone("yellowjacketray", vector3(1984.3658, 3052.6796, 47.467021), 0.6,
    {
        name = "yellowjacketray",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-yellowjack:OpenPlateee",
                icon = "fas fa-circle",
                label = "Open Tray",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("coolbeaesout", vector3(-1191.698, -1137.744, 7.8773579), 0.6,
    {
        name = "coolbeaesout",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-coolbeans:interact:stash",
                icon = "fas fa-circle",
                label = "Open Personal Locker",
                job = "coolbeans",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("upnout", vector3(85.737663, 293.53601, 110.50701), 0.6,
    {
        name = "upnout",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-atom:interact:stash",
                icon = "fas fa-circle",
                label = "Open Personal Locker",
                job = "burgershot",
            },
        },
        distance = 1.5
    }
)

RegisterNetEvent('qb-cryptoselling:sbuy')
AddEventHandler('qb-cryptoselling:sbuy', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Sell Crypto Papers",
            txt = "",        
        },
        {
			id = 2,
            header = "Sell Crypto Papers",
			txt = "Sell Crypto Papers",
			params = {
                event = 'qb-cryptoselling:sellitems'
            }
        },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)

RegisterNetEvent("qb-cryptoselling:sellitems")
AddEventHandler("qb-cryptoselling:sellitems", function()
    TriggerServerEvent('qb-cryptoselling:sellitemsv')
end)

RegisterNetEvent('qb-cryptoselling:hmenu')
AddEventHandler('qb-cryptoselling:hmenu', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Sell Crypto Papers",
            txt = "", 
        },
        {
			id = 3,
            header = "Sell Your Crypto Papers",
			txt = "Sell Crypto Papers",
			params = {
                event = "qb-cryptoselling:sbuy",
            }
        },
        {
			id = 4,
            header = "Close", 
            txt = "",
            params = {
                event = "",
            }
        },
    })
-- else
--     QBCore.Functions.Notify("I'm not dealing with anyone at the moment, come back later", 'error')
--     end
end)

-- BEE

RegisterNetEvent('qb-beekeeping:sbuy')
AddEventHandler('qb-beekeeping:sbuy', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "BeeKeeping Market",
            txt = "",        
        },
        {
			id = 2,
            header = "Sell BeeKeeping stuff",
			txt = "Sell BeeKeeping stuff",
			params = {
                event = 'qb-beekeeping:sellitems'
            }
        },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)


RegisterNetEvent('qb-blackmarket:sbuy')
AddEventHandler('qb-blackmarket:sbuy', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Market",
            txt = "",        
        },
        {
			id = 2,
            header = "Sell people stuff (Cash)",
			txt = "Sell Your Ass Items",
			params = {
                event = 'qb-blackmarket:sellitems'
            }
        },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)

RegisterNetEvent('qb-blackmarket:sbuy2')
AddEventHandler('qb-blackmarket:sbuy2', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Cards Market",
            txt = "",        
        },
        {
			id = 2,
            header = "Sell people Cards (Cash)",
			txt = "Sell Your Cards Items",
			params = {
                event = 'qb-blackmarket:sellitems2'
            }
        },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)

RegisterNetEvent("qb-pawnshop:table")
AddEventHandler("qb-pawnshop:table", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray", {
        maxweight = 350000,
        slots = 30,
    })
end)

RegisterNetEvent("qb-customcafe:table")
AddEventHandler("qb-customcafe:table", function()
    TriggerEvent("inventory:client:SetCurrentStash", "traycafe10")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "traycafe10", {
        maxweight = 350000,
        slots = 30,
    })
end)

RegisterNetEvent("qb-customcafe:tablegridge")
AddEventHandler("qb-customcafe:tablegridge", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Fridgecafe101")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridgecafe101", {
        maxweight = 350000,
        slots = 30,
    })
end)

RegisterNetEvent("qb-pawn:tray2")
AddEventHandler("qb-pawn:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray2", {
        maxweight = 350000,
        slots = 30,
    })
end)

RegisterNetEvent("qb-taco:tray6")
AddEventHandler("qb-taco:tray6", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray6")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray6", {
        maxweight = 350000,
        slots = 30,
    })
end)

RegisterNetEvent("qb-taconew:tray2")
AddEventHandler("qb-taconew:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray11")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray111", {
        maxweight = 350000,
        slots = 30,
    })
end)

-- exports['qb-target']:AddCircleZone('tray', vector3(-320.7291, -95.26486, 47.505573), 1.0,{
--     name = 'tray', debugPoly = false, useZ=true}, {
--     options = {{label = "Put On The Table" ,icon = 'fa-solid fa-hand-holding', action = function() TriggerEvent('qb-pawnshop:table') end}},
--     distance = 2.0
-- })

RegisterNetEvent('qb-blackmarket:robitems')
AddEventHandler('qb-blackmarket:robitems', function()
     exports['qb-menu']:openMenu({
        {
			id = 1,
            header = "Available Items",
            txt = "",        
        },
        {
			id = 2,
            header = "Pawn Store",
			txt = "Open you fucking shit store and learn English!",
			params = {
                event = 'qb-shops:marketshop'
            }
        },
        -- {
		-- 	id = 3,
        --     header = "BlackMarket VPN",
		-- 	txt = "Illegal Item, Get One - (2,000$)",
		-- 	params = {
        --         event = 'qb-blackmarket:pacificusb'
        --     }
        -- },
        -- {
		-- 	id = 4,
        --     header = "Boosting VPN",
		-- 	txt = "Illegal Item, Get One - (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:boostingvpn'
        --     }
        -- },
        -- {
		-- 	id = 5,
        --     header = "Electronic Kit",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:electronickit'
        --     }
        -- },
        -- {
		-- 	id = 6,
        --     header = "Thermite",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:thermite'
        --     }
        -- },
        -- {
		-- 	id = 7,
        --     header = "Advanced Lockpick",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:advancedlockpick'
        --     }
        -- },
        -- {
		-- 	id = 8,
        --     header = "Lockpick",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:lockpick'
        --     }
        -- },
        -- {
		-- 	id = 9,
        --     header = "Decrypter",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:decrypter'
        --     }
        -- },
        -- {
		-- 	id = 10,
        --     header = "ToolBox (/RemoveGPS)",
		-- 	txt = "Illegal Item, Get One (2,000$)",
		-- 	params = {
        --         event = 'blackmarket:screwdriverset'
        --     }
        -- },
        {
			id = 3,
            header = "Close",
			txt = "",
			params = {
                event = ''
            }
        },
    })
end)

-- Bee

RegisterNetEvent("qb-beekeeping:sellitems")
AddEventHandler("qb-beekeeping:sellitems", function()
    TriggerServerEvent('qb-beekeeping:sellitemsv')
end)

RegisterNetEvent("qb-blackmarket:sellitems")
AddEventHandler("qb-blackmarket:sellitems", function()
    TriggerServerEvent('qb-blackmarket:sellitemsv')
end)

RegisterNetEvent("qb-blackmarket:sellitems2")
AddEventHandler("qb-blackmarket:sellitems2", function()
    TriggerServerEvent('qb-blackmarket:sellitemsv2')
end)

RegisterNetEvent("qb-blackmarket:pacificusb")
AddEventHandler("qb-blackmarket:pacificusb", function()
    TriggerServerEvent('blackmarket:pacificusb')
end)

RegisterNetEvent("qb-blackmarket:darkweb")
AddEventHandler("qb-blackmarket:darkweb", function()
    TriggerServerEvent('blackmarket:darkweb')
end)

RegisterNetEvent("blackmarket:boostingvpn")
AddEventHandler("blackmarket:boostingvpn", function()
    TriggerServerEvent('blackmarket:boostingvpn')
end)

RegisterNetEvent("blackmarket:electronickit")
AddEventHandler("blackmarket:electronickit", function()
    TriggerServerEvent('blackmarket:electronickit')
end)

RegisterNetEvent("blackmarket:thermite")
AddEventHandler("blackmarket:thermite", function()
    TriggerServerEvent('blackmarket:thermite')
end)

RegisterNetEvent("blackmarket:advancedlockpick")
AddEventHandler("blackmarket:advancedlockpick", function()
    TriggerServerEvent('blackmarket:advancedlockpick')
end)

RegisterNetEvent("blackmarket:lockpick")
AddEventHandler("blackmarket:lockpick", function()
    TriggerServerEvent('blackmarket:lockpick')
end)

RegisterNetEvent("blackmarket:decrypter")
AddEventHandler("blackmarket:decrypter", function()
    TriggerServerEvent('blackmarket:decrypter')
end)

RegisterNetEvent("blackmarket:screwdriverset")
AddEventHandler("blackmarket:screwdriverset", function()
    TriggerServerEvent('blackmarket:screwdriverset')
end)

-- police report

exports["qb-target"]:AddCircleZone("policereport", vector3(441.89929, -979.6744, 30.689529), 0.6,
    {
        name = "policereport",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                type = "server",
                event = "lg: openReport",
                icon = "fas fa-clipboard",
                label = "Report",
                -- job = "pawn",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("openpolicereport", vector3(452.34921, -999.8957, 30.811233), 0.6,
    {
        name = "openpolicereport",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                type = "server",
                event = "lg: openAllReports",
                icon = "fas fa-clipboard",
                label = "Open All Reports",
                job = "police",
            },
        },
        distance = 1.5
    }
)

--

exports["qb-target"]:AddCircleZone("btray", vector3(-322.7301, -99.83706, 47.510524), 0.6,
    {
        name = "btray",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-pawn:tray2",
                icon = "fas fa-circle",
                label = "Open Table",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("sandcheck", vector3(1832.739, 3682.5397, 34.189266), 0.6,
    {
        name = "sandcheck",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "Sandy:CheckIn",
                icon = "fas fa-circle",
                label = "Check In",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("foodpolice", vector3(476.98245, -1007.043, 26.273227), 0.6,
    {
        name = "foodpolice",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-food:client:start",
                icon = "fas fa-circle",
                label = "Take Food And Water",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("fooddavis", vector3(376.90145, -1602.905, 25.451725), 0.6,
    {
        name = "fooddavis",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-food:client:start",
                icon = "fas fa-circle",
                label = "Take Food And Water",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("btray6", vector3(387.30679, -311.832, 46.91093), 0.6,
    {
        name = "btray6",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-taco:tray6",
                icon = "fas fa-circle",
                label = "Open Storage",
                job = "taco",
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("bILLPAWN", vector3(-315.2203, -102.2752, 47.884479), 0.6,
    {
        name = "bILLPAWN",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                type = "client",
                event = "jim-payments:client:Charge",
                icon = "fas fa-dollar",
                label = "Open Cashier",
                job = "pawn",
            },
        },
        distance = 1.5
    }
)

-- exports["qb-target"]:AddCircleZone("weaponat", vector3(2340.2968, 3058.2839, 48.151893), 0.6,
--     {
--         name = "weaponat",
--         debugPoly = false,
--         useZ = true
--     },
--     {
--         options = {
--             {
--                 event = "qb-shops:marketshop",
--                 icon = "fas fa-circle",
--                 label = "Weapons Attachments",
--             },
--         },
--         distance = 1.5
--     }
-- )

exports["qb-target"]:AddCircleZone("bmarket", vector3(-708.8865, -900.653, 23.805557), 0.6,
    {
        name = "bmarket",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-blackmarket:hmenu",
                icon = "fas fa-circle",
                label = "Sell your things",
                -- job = "pawn",
            },
            -- {
            --     event = "qb-shops:marketshop",
            --     icon = "fas fa-circle",
            --     label = "Pawn Store",
            --     job = {["pawn"] = 2}
            -- },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("correctionsarmory", vector3(1841.247, 2573.4345, 45.94318), 0.6,
    {
        name = "correctionsarmory",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "police:openCArmory",
                icon = "fas fa-circle",
                label = "Corrections Armory",
                job = "corrections"
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("bosssd", vector3(1826.0421, 3671.7519, 38.814426), 0.6,
    {
        name = "bosssd",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-circle",
                label = "Open Boss Menu",
                job = {["police"] = 29, 30, 31, 32, 33, 34, 35, 36, 37}
            },
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddCircleZone("yellowjack1", vector3(1985.1612, 3048.5036, 47.385982), 0.6,
    {
        name = "yellowjack1",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "qb-shops:marketshop",
                icon = "fas fa-circle",
                label = "Yellow Jack Store",
                job = "yellowjack",
            },
        },
        distance = 1.5
    }
)

