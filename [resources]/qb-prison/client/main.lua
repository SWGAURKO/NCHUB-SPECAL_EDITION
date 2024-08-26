Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

QBCore = exports['qb-core']:GetCoreObject() -- Used Globally

isLoggedIn = false
inJail = false
jailTime = 0
currentJob = "electrician"
PlayerJob = {}

Citizen.CreateThread(function()
    TriggerEvent('prison:client:JailAlarm', false)
	while true do 
		Citizen.Wait(7)
		if jailTime > 0 and inJail then 
			Citizen.Wait(1000 * 60)
			if jailTime > 0 and inJail then
				jailTime = jailTime - 1
				if jailTime <= 0 then
					jailTime = 0
					QBCore.Functions.Notify("Your time is up, check yourself out at the visitor center.", "success", 10000)
				end
				TriggerServerEvent("prison:server:SetJailStatus", jailTime)
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.TriggerCallback('prison:server:IsAlarmActive', function(active)
		if active then
			TriggerEvent('prison:client:JailAlarm', true)
		end
	end)
	PlayerJob = QBCore.Functions.GetPlayerData().job
end)

--[[
	Locations n stuff
]]
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if isLoggedIn then
			if inJail then
				local pos = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, true) < 1.5) then
					QBCore.Functions.DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "~g~E~w~ - Check time")
					if IsControlJustReleased(0, Keys["E"]) then
						TriggerEvent("prison:client:Leave")
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, true) < 2.5) then
					QBCore.Functions.DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "Check time")
				end  

				if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, true) < 1.5) then
					QBCore.Functions.DrawText3D(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, "~g~E~w~ - Canteen")
					if IsControlJustReleased(0, Keys["E"]) then
                        local ShopItems = {}
                        ShopItems.label = "Prison Canteen"
                        ShopItems.items = Config.CanteenItems
                        ShopItems.slots = #Config.CanteenItems
                        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Canteen"..math.random(1, 99), ShopItems)
					end
					DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, true) < 2.5) then
					QBCore.Functions.DrawText3D(Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, "Canteen")
					DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, true) < 10) then
					DrawMarker(2, Config.Locations["shop"].coords.x, Config.Locations["shop"].coords.y, Config.Locations["shop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
				end  
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

-- By Brainer#8652 (Shop Of Prison)
RegisterNetEvent('qb-shops:client:OpenPrisonShop')
AddEventHandler('qb-shops:client:OpenPrisonShop', function()
    local ShopItems = {}
    ShopItems.label = "Prison Market"
    ShopItems.items = {
        [1] = { name = "sandwich", price = 5, amount = 2500, info = {}, type = "item", slot = 1 },
        [2] = { name = "water_bottle", price = 5, amount = 2500, info = {}, type = "item", slot = 2 },

    }
    ShopItems.slots = #ShopItems.items
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "PrisonShop", ShopItems)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
	QBCore.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] > 0 then
			TriggerEvent("prison:client:Enter", PlayerData.metadata["injail"])
		end
	end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
	inJail = false
	currentJob = nil
	RemoveBlip(currentBlip)
end)

RegisterNetEvent('prison:client:Enter')
AddEventHandler('prison:client:Enter', function(time)
	TriggerEvent("debug", 'Prison: Enter', 'success')

	QBCore.Functions.Notify("You are in jail for "..time.." months..", "error")
	QBCore.Functions.Notify("Your items has been confiscated, you get everything back when your time is up..")
	DoScreenFadeOut(500)
	while not IsScreenFadedOut() do
		Citizen.Wait(10)
	end
	local RandomStartPosition = Config.Locations.spawns[math.random(#Config.Locations.spawns)]
	SetEntityCoords(GetPlayerPed(-1), RandomStartPosition.x, RandomStartPosition.y, RandomStartPosition.z - 0.9, 0, 0, 0, false)
	SetEntityHeading(GetPlayerPed(-1), RandomStartPosition.h)
	Citizen.Wait(500)

	inJail = true
	jailTime = time
	currentJob = "electrician"
	TriggerServerEvent("prison:server:SetJailStatus", jailTime)
	TriggerServerEvent("prison:server:SaveJailItems", jailTime)

	TriggerServerEvent("InteractSound_SV:PlayOnSource", "jail", 0.5)
	
	Citizen.Wait(2000)

	DoScreenFadeIn(1000)
	QBCore.Functions.Notify("Do some work for a reduced sentence, current job: "..Config.Jobs[currentJob])
end)

RegisterNetEvent('prison:client:Leave')
AddEventHandler('prison:client:Leave', function()
	TriggerEvent("debug", 'Prison: Leave', 'error')

	if jailTime > 0 then 
		QBCore.Functions.Notify("You still have "..jailTime.." months..")
	else
		jailTime = 0
		TriggerServerEvent("prison:server:SetJailStatus", 0)
		TriggerServerEvent("prison:server:GiveJailItems")
		QBCore.Functions.Notify("You have received your items back.")
		inJail = false
		RemoveBlip(currentBlip)
		QBCore.Functions.Notify("You are free, dont do anything stupid..")
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
		SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.h)

		Citizen.Wait(500)

		DoScreenFadeIn(1000)
	end
end)

RegisterNetEvent('prison:client:UnjailPerson')
AddEventHandler('prison:client:UnjailPerson', function()
	if jailTime > 0 then
		TriggerEvent("debug", 'Prison: Unjail', 'error')

		TriggerServerEvent("prison:server:SetJailStatus", 0)
		TriggerServerEvent("prison:server:GiveJailItems")
		QBCore.Functions.Notify("You have received your possessions.")
		inJail = false
		RemoveBlip(currentBlip)
		QBCore.Functions.Notify("You are free, dont do anything stupid..")
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
		SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.h)

		Citizen.Wait(500)

		DoScreenFadeIn(1000)
	end
end)

function Stats()
	return inJail, jailTime
end

RegisterNetEvent("prison:client:food", function()
	FoodItems = {
		label = "Prison Food",
		slots = 2,
		items = {
			[1] = {
				name = "sandwich",
				price = 15,
				amount = 50,
				info = {},
				type = "item",
				slot = 1,
			},
			[2] = {
				name = "water_bottle",
				price = 15,
				amount = 50,
				info = {},
				type = "item",
				slot = 2,
			}
		}
	}
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Prison Food", FoodItems)
end)

function BuildInteract()
    -- for name, value in next, Config.Zones do
    --     if value['data'] then
    --         exports['qb-interact']:AddPolyTarget(name, value['data'])
    --     end
    -- end
	exports['qb-target']:AddBoxZone("prison", vector3(1777.2916, 2494.1855, 50.427352), 3.0, 3.3, {
        name = "prisond",
        heading = 30,
        minZ = 49.427352 - (1.5 / 2),
        maxZ = 51.427352 + (1.5 / 2),
        debugPoly = false
        }, {
            options = {
                {
                    event = "prison:client:Leave",
                    icon = "fas fa-hourglass-half",
                    label = "Check / Leave"
                },
            },
            job = {"all"},
            distance = 2.0
    })

	exports['qb-target']:AddBoxZone("prisonfood", vector3(1780.7615, 2560.8288, 45.673137), 3.0, 3.3, {
        name = "prisonfood",
        heading = 0,
        minZ = 44.6731 - (1.5 / 2),
        maxZ = 46.6731 + (1.5 / 2),
        debugPoly = false
        }, {
            options = {
                {
                    event = "prison:client:food",
                    icon = "fas fa-burger",
                    label = "Get Food"
                },
            },
            job = {"all"},
            distance = 2.0
    })
end

CreateThread(BuildInteract)