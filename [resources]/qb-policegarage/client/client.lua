local QBCore = exports['qb-core']:GetCoreObject()

local InPreview = false

local isActive = false

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onClientResourceStart',function()
    Citizen.CreateThread(function()
        while true do
            if QBCore ~= nil and QBCore.Functions.GetPlayerData ~= nil then
                QBCore.Functions.GetPlayerData(function(PlayerData)
                    if PlayerData.job then
                        PlayerJob = PlayerData.job
                    end
                end)
                break
            end
        end
        Citizen.Wait(1)
    end)
end)

RegisterNetEvent('qb-policegarage:Menu', function()
    local Menu = {
        {
            header = "Police Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-policegarage:Catalog",
            }
        }
    }
    -- Menu[#Menu+1] = {
    --     header = "Preview Vehicles",
    --     txt = "View Vehicles",
    --     params = {
    --         event = "qb-policegarage:PreviewCarMenu",
    --     }
    -- }
    if not Config.UseMarkerInsteadOfMenu then
        -- Menu[#Menu+1] = {
        --     header = "⬅ Store Vehicle",
        --     params = {
        --         event = "qb-policegarage:StoreVehicle"
        --     }
        -- }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-policegarage:Menu2', function()
    local Menu = {
        {
            header = "Paleto Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-policegarage:Catalog2",
            }
        }
    }
    Menu[#Menu+1] = {
        header = "Preview Vehicles",
        txt = "View Vehicles",
        params = {
            event = "qb-policegarage:PreviewCarMenu2",
        }
    }
    if not Config.UseMarkerInsteadOfMenu then
        Menu[#Menu+1] = {
            header = "⬅ Store Vehicle",
            params = {
                event = "qb-policegarage:StoreVehicle"
            }
        }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-policegarage:Menu3', function()
    local Menu = {
        {
            header = "Davis Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-policegarage:Catalog3",
            }
        }
    }
    Menu[#Menu+1] = {
        header = "Preview Vehicles",
        txt = "View Vehicles",
        params = {
            event = "qb-policegarage:PreviewCarMenu3",
        }
    }
    if not Config.UseMarkerInsteadOfMenu then
        Menu[#Menu+1] = {
            header = "⬅ Store Vehicle",
            params = {
                event = "qb-policegarage:StoreVehicle"
            }
        }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-policegarage:Menu4', function()
    local Menu = {
        {
            header = "Sandy Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-policegarage:Catalog4",
            }
        }
    }
    Menu[#Menu+1] = {
        header = "Preview Vehicles",
        txt = "View Vehicles",
        params = {
            event = "qb-policegarage:PreviewCarMenu4",
        }
    }
    if not Config.UseMarkerInsteadOfMenu then
        Menu[#Menu+1] = {
            header = "⬅ Store Vehicle",
            params = {
                event = "qb-policegarage:StoreVehicle"
            }
        }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-policegarage:Menu5', function()
    local Menu = {
        {
            header = "Prison Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-policegarage:Catalog5",
            }
        }
    }
    Menu[#Menu+1] = {
        header = "Preview Vehicles",
        txt = "View Vehicles",
        params = {
            event = "qb-policegarage:PreviewCarMenu5",
        }
    }
    if not Config.UseMarkerInsteadOfMenu then
        Menu[#Menu+1] = {
            header = "⬅ Store Vehicle",
            params = {
                event = "qb-policegarage:StoreVehicle"
            }
        }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent("qb-policegarage:Catalog", function()
    local vehicleMenu = {
        {
            header = "Police Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-policegarage:TakeMoney",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("qb-policegarage:Catalog2", function()
    local vehicleMenu = {
        {
            header = "Paleto Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-policegarage:TakeMoney2",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("qb-policegarage:Catalog3", function()
    local vehicleMenu = {
        {
            header = "Davis Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-policegarage:TakeMoney3",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("qb-policegarage:Catalog4", function()
    local vehicleMenu = {
        {
            header = "Sandy Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-policegarage:TakeMoney4",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("qb-policegarage:Catalog5", function()
    local vehicleMenu = {
        {
            header = "Prison Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-policegarage:TakeMoney5",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-policegarage:PreviewCarMenu', function()
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }
    for k, v in pairs(Config.Vehicles) do
        PreviewMenu[#PreviewMenu+1] = {
            header = v.vehiclename,
            txt = "Preview: " .. v.vehiclename,
            params = {
                event = "qb-policegarage:PreviewVehicle",
                args = {
                    vehicle = v.vehicle,
                }
            }
        }
    end
    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu"
        }
    }
    exports['qb-menu']:openMenu(PreviewMenu)
end)

RegisterNetEvent('qb-policegarage:PreviewCarMenu2', function()
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }
    for k, v in pairs(Config.Vehicles) do
        PreviewMenu[#PreviewMenu+1] = {
            header = v.vehiclename,
            txt = "Preview: " .. v.vehiclename,
            params = {
                event = "qb-policegarage:PreviewVehicle2",
                args = {
                    vehicle = v.vehicle,
                }
            }
        }
    end
    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu2"
        }
    }
    exports['qb-menu']:openMenu(PreviewMenu)
end)

RegisterNetEvent('qb-policegarage:PreviewCarMenu3', function()
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }
    for k, v in pairs(Config.Vehicles) do
        PreviewMenu[#PreviewMenu+1] = {
            header = v.vehiclename,
            txt = "Preview: " .. v.vehiclename,
            params = {
                event = "qb-policegarage:PreviewVehicle3",
                args = {
                    vehicle = v.vehicle,
                }
            }
        }
    end
    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu3"
        }
    }
    exports['qb-menu']:openMenu(PreviewMenu)
end)

RegisterNetEvent('qb-policegarage:PreviewCarMenu4', function()
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }
    for k, v in pairs(Config.Vehicles) do
        PreviewMenu[#PreviewMenu+1] = {
            header = v.vehiclename,
            txt = "Preview: " .. v.vehiclename,
            params = {
                event = "qb-policegarage:PreviewVehicle4",
                args = {
                    vehicle = v.vehicle,
                }
            }
        }
    end
    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu4"
        }
    }
    exports['qb-menu']:openMenu(PreviewMenu)
end)

RegisterNetEvent('qb-policegarage:PreviewCarMenu5', function()
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }
    for k, v in pairs(Config.Vehicles) do
        PreviewMenu[#PreviewMenu+1] = {
            header = v.vehiclename,
            txt = "Preview: " .. v.vehiclename,
            params = {
                event = "qb-policegarage:PreviewVehicle5",
                args = {
                    vehicle = v.vehicle,
                }
            }
        }
    end
    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-policegarage:Menu5"
        }
    }
    exports['qb-menu']:openMenu(PreviewMenu)
end)

--[[CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed) 
        local letSleep = true

        if PlayerJob.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 441.45, -975.07, 25.7, true) < 10) then
                letSleep = false
                -- DrawMarker(36, 441.45, -975.07, 25.7 + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 0, 0, 0, 255, true, false, false, true, false, false, false)
                if Config.UseMarkerInsteadOfMenu then
                    if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 441.45, -975.07, 25.7, true) < 1.5) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                        DrawText3D(441.45, -975.07, 28.7, "~g~E~w~ - Police Garage") 
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-policegarage:Menu")
                        end
                    end
                    if IsPedInAnyVehicle(PlayerPedId(), false) then   
                        DrawText3D(441.45, -975.07, 25.7, "~g~E~w~ - Store Vehicle (Will Get Impounded)") 
                    end
                    if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(PlayerPedId(), false) then
                        TriggerEvent("qb-policegarage:StoreVehicle")
                    end
                else
                    if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 441.45, -975.07, 25.7, true) < 1.5) then
                        DrawText3D(441.45, -975.07, 25.7, "~g~E~w~ - Police Garage") 
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-policegarage:Menu")
                        end
                    end
                end
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)]]

CreateThread(function()
	exports['qb-target']:AddBoxZone("Policegarage", vector3(542.17407, 5.670783, 69.511169), 1, 1.2, {
		name = "Policegarage",
		heading = 32,
		debugPoly = false,
		minZ=68.511169,
		maxZ=70.511169,
	}, {
		options = {
		    {  
			event = "qb-policegarage:Menu",
			icon = "far fa-clipboard",
			label = "Open Garage",
			job = "police",
		    },
		},
		distance = 1.5
	})
end)

CreateThread(function()
	exports['qb-target']:AddBoxZone("Paletogarage", vector3(-461.77, 6029.37, 31.45), 1, 1.2, {
		name = "Paletogarage",
		heading = 42.07,
		debugPoly = false,
		minZ=31.45,
		maxZ=32.35,
	}, {
		options = {
		    {  
			event = "qb-policegarage:Menu2",
			icon = "far fa-clipboard",
			label = "Open Garage",
			job = "police",
		    },
		},
		distance = 1.5
	})
end)

CreateThread(function()
	exports['qb-target']:AddBoxZone("Davisgarage", vector3(378.48, -1620.72, 29.29), 1, 1.2, {
		name = "Davisgarage",
		heading = 226.13,
		debugPoly = false,
		minZ=29.29,
		maxZ=30.31,
	}, {
		options = {
		    {  
			event = "qb-policegarage:Menu3",
			icon = "far fa-clipboard",
			label = "Open Garage",
			job = "police",
		    },
		},
		distance = 1.5
	})
end)

CreateThread(function()
	exports['qb-target']:AddBoxZone("sandygarage", vector3(1838.3646, 3689.7944, 33.974582), 1, 1.2, {
		name = "sandygarage",
		heading = 181.9018,
		debugPoly = false,
	}, {
		options = {
		    {  
			event = "qb-policegarage:Menu4",
			icon = "far fa-clipboard",
			label = "Open PD Garage",
			job = "police",
		    },
		},
		distance = 1.5
	})
end)

CreateThread(function()
	exports['qb-target']:AddBoxZone("prisongarage", vector3(1851.984, 2589.9653, 45.691276), 1, 1.2, {
		name = "prisongarage",
		heading = 275.0,
		debugPoly = false,
	}, {
		options = {
		    {  
			event = "qb-policegarage:Menu5",
			icon = "far fa-clipboard",
			label = "Open Garage",
			job = "police",
		    },
		},
		distance = 1.5
	})
end)

RegisterNetEvent("nc:policegarage:open")
AddEventHandler("nc:policegarage:open", function()
    TriggerEvent("qb-policegarage:Menu")
end)

RegisterNetEvent('qb-policegarage:client:SetActive', function(status)
    isActive = status
end)

RegisterNetEvent('qb-policegarage:StoreVehicle')
AddEventHandler('qb-policegarage:StoreVehicle', function()
    local ped = PlayerPedId()
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    if IsPedInAnyVehicle(ped, false) then
        TaskLeaveVehicle(ped, car, 1)
        Citizen.Wait(2000)
        QBCore.Functions.Notify('Vehicle Stored!')
        DeleteVehicle(car)
        DeleteEntity(car)
    else
        QBCore.Functions.Notify("You Are Not In Any Vehicle !", "error")
    end
end)

local function SetCarItemsInfo()
	local items = {}
	for k, item in pairs(Config.CarItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end

RegisterNetEvent("qb-policegarage:SpawnVehicle")
    AddEventHandler("qb-policegarage:SpawnVehicle", function(vehicle)
    local coords = vector4(540.23193, 7.0188422, 68.796058, 31.965724)
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)
    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
    exports['cdn-fuel']:SetFuel(veh, 100)
    CloseMenu()
    if Config.UseColors == true then
    SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
    SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
    SetVehicleEngineOn(veh, true, true)
    TriggerServerEvent("qb-policegarage:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-policegarage:SpawnVehicle2")
    AddEventHandler("qb-policegarage:SpawnVehicle2", function(vehicle)
    local coords = vector4(-457.32, 6044.95, 31.34, 137.72)
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)
    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
    exports['cdn-fuel']:SetFuel(veh, 100)
    CloseMenu()
    if Config.UseColors == true then
    SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
    SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
    SetVehicleEngineOn(veh, true, true)
    TriggerServerEvent("qb-policegarage:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-policegarage:SpawnVehicle3")
    AddEventHandler("qb-policegarage:SpawnVehicle3", function(vehicle)
    local coords = vector4(390.18, -1621.96, 29.29, 320.2)
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)
    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
    exports['cdn-fuel']:SetFuel(veh, 100)
    CloseMenu()
    if Config.UseColors == true then
    SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
    SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
    SetVehicleEngineOn(veh, true, true)
    TriggerServerEvent("qb-policegarage:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-policegarage:SpawnVehicle4")
    AddEventHandler("qb-policegarage:SpawnVehicle4", function(vehicle)
    local coords = vector4(1860.9949, 3699.1704, 33.974582, 120.35945)
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)
    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
    exports['cdn-fuel']:SetFuel(veh, 100)
    CloseMenu()
    if Config.UseColors == true then
    SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
    SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
    SetVehicleEngineOn(veh, true, true)
    TriggerServerEvent("qb-policegarage:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-policegarage:SpawnVehicle5")
    AddEventHandler("qb-policegarage:SpawnVehicle5", function(vehicle)
    local coords = vector4(1870.2221, 2591.9733, 45.279865, 90.262466)
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)
    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
    exports['cdn-fuel']:SetFuel(veh, 100)
    CloseMenu()
    if Config.UseColors == true then
    SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
    SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
    SetVehicleEngineOn(veh, true, true)
    TriggerServerEvent("qb-policegarage:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-policegarage:PreviewVehicle")
AddEventHandler("qb-policegarage:PreviewVehicle", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-policegarage:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(436.3, -975.93, 25.31, 89.64) 
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['cdn-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)
                
                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 436.16, -980.46, 27.06, 50, 0.00, 1.84, 100.00, false, 0)   
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-policegarage:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(452.11, -992.76, 25.31, 359.31) 
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['cdn-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)
        
            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 436.16, -980.46, 27.06, 50, 0.00, 1.84, 100.00, false, 0)
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

RegisterNetEvent("qb-policegarage:PreviewVehicle2")
AddEventHandler("qb-policegarage:PreviewVehicle2", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-policegarage:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(-474.73, 6012.64, 31.34, 345.43)
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['cdn-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)
                
                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -474.81, 6009.17, 35.58, 312.66, 0.00, 1.84, 100.00, false, 0)   
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-policegarage:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(-474.73, 6012.64, 31.34, 345.43)
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['cdn-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)

            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -474.81, 6009.17, 35.58, 312.66, 0.00, 1.84, 100.00, false, 0)   
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

RegisterNetEvent("qb-policegarage:PreviewVehicle3")
AddEventHandler("qb-policegarage:PreviewVehicle3", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-policegarage:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(390.18, -1621.96, 29.29, 320.2)
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['cdn-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)

                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 389.35, -1631.64, 32.51, 345.82, 0.00, 1.84, 100.00, false, 0)   
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-policegarage:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(390.18, -1621.96, 29.29, 320.2)
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['cdn-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)

            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 389.35, -1631.64, 32.51, 345.82, 0.00, 1.84, 100.00, false, 0)   
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

RegisterNetEvent("qb-policegarage:PreviewVehicle4")
AddEventHandler("qb-policegarage:PreviewVehicle4", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-policegarage:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(1846.5623, 3704.8852, 33.974651, 158.80738)
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['cdn-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)

                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1848.7539, 3693.7043, 33.974578, 40.782535, 0.00, 1.84, 100.00, false, 0)   
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-policegarage:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(1846.5623, 3704.8852, 33.974651, 158.80738)
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['cdn-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)

            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1848.7539, 3693.7043, 33.974578, 40.782535, 0.00, 1.84, 100.00, false, 0)   
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

RegisterNetEvent("qb-policegarage:PreviewVehicle5")
AddEventHandler("qb-policegarage:PreviewVehicle5", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-policegarage:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(1860.3299, 2590.467, 45.279804, 0.3846883)
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['cdn-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)
                
                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1854.4652, 2590.3513, 45.672779, 0.0, 0.0, -90.0, 90.0)
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-policegarage:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(1860.3299, 2590.467, 45.279804, 0.3846883)
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['cdn-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)
        
            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 1854.4652, 2590.3513, 45.672779, 0.0, 0.0, -90.0, 90.0)
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

function CloseMenu()
    exports['qb-menu']:closeMenu()
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end