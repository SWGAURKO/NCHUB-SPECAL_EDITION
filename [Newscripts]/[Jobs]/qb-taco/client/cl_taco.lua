local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

Citizen.CreateThread(function()
    Taco = AddBlipForCoord(382.70388, -318.1873, 46.955852)
    SetBlipSprite (Taco, 607)
    SetBlipDisplay(Taco, 4)
    SetBlipScale  (Taco, 0.6)
    SetBlipAsShortRange(Taco, true)
    SetBlipColour(Taco, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Mexican Restaurant")
    EndTextCommandSetBlipName(Taco)
end)  

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        TacoZones()
    end
end)

Citizen.CreateThread(function()
    while (true) do
		ClearAreaOfPeds(383.88174, -319.7059, 46.955848, 179.60476, 1.0)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
exports['qb-target']:AddBoxZone("Taco_register_1", vector3(386.69314, -314.6449, 46.331726), 1.0, 0.8, {
    name="Taco_register_1",
    debugPoly=false,
    heading=125,
    minZ=45.331726,
    maxZ=47.331726,
}, {
        options = {
            {
                event = "jim-payments:client:Charge",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
                job = "taco",
            },
            {
                event = "qb-taco:OpenPlateee",
                icon = "fas fa-circle",
                label = "Open Tray",
            },
        },
        distance = 1.5
    })

end)


AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['qb-target']:RemoveZone("taco"..k)
        end
        DeletePed(jobPed)
    end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    TacoZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:RemoveZone("taco"..k)
    end
    DeletePed(jobPed)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function TacoZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone("taco"..k, v.coords, v.radius, {
            name = "taco"..k,
            debugPoly = false,
            useZ=true,
        }, {
            options = {
                {
                    type = "client",
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 1.5
        })
    end
    if not DoesEntityExist(jobPed) then

	RequestModel(Config.GaragePed) while not HasModelLoaded(Config.GaragePed) do Wait(0) end

	-- jobPed = CreatePed(0, Config.GaragePed, Config.PedLocation, false, false)

	SetEntityAsMissionEntity(jobPed, true, true)
	SetPedFleeAttributes(jobPed, 0, 0)
	SetBlockingOfNonTemporaryEvents(jobPed, true)
	SetEntityInvincible(jobPed, true)
	FreezeEntityPosition(jobPed, true)
	loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")        
	TaskPlayAnim(jobPed, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

	exports['qb-target']:AddTargetEntity(jobPed, { 
	    options = {
		{ 
		    type = "client",
		    event = "jissuunnn-taco:client:jobGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Garage",
		    job = "taco"
		},
		{ 
		    type = "client",
		    event = "jissuunnn-taco:client:storeGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Store Vehicle",
		    job = "taco"
		},
	    }, 
	    distance = 1.5, 
	})
    end
end


CreateThread(function()
    DecorRegister("t_vehicle", 1)
end)

RegisterNetEvent('jissuunnn-taco:client:storeGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
    if DecorExistOn((veh), "t_vehicle") then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify("You returned the vehicle.", "success")
    else
        QBCore.Functions.Notify("This is not a work vehicle.", "error")
    end
end)
    
RegisterNetEvent("jissuunnn-taco:client:frontTray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacofoodtray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacofoodtray1", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("jissuunnn-taco:client:jobFridge1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacofridge1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacofridge1", {
        maxweight = 3000000,
        slots = 30,
    })
end)

RegisterNetEvent("jissuunnn-taco:client:ingredientStore", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "taco", Config.Items)
end)

RegisterNetEvent('jissuunnn-taco:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("jissuunnn-taco:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("jissuunnn-taco:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)
