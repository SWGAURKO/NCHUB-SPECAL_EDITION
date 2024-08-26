Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(0, 36, true)
        -- DisableControlAction(0, 45, true)
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5) 
		if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
	
			DisableControlAction(0, 140, true) 
			DisableControlAction(0, 141, true) 
			DisableControlAction(0, 142, true) 
		
		end
	end
end)


RegisterNetEvent('police:fix')
AddEventHandler('police:fix', function()
    if not IsNearPoliceGarage() then
        return
    end

    if IsPedInAnyVehicle(PlayerPedId()) then
	    local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)
        local curfuelpfix = GetVehicleFuelLevel(veh)
        QBCore.Functions.Progressbar("fixing_vehicle", "Working on your car", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId()))
            SetVehicleFuelLevel(veh, curfuelpfix + 0.0)
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message system">SYSTEM: {0}</div>',
                args = { 'All done, you are good to go' }
            })
        end, function()
		    FreezeEntityPosition(veh, false)
        end)
    end
end)

local PoliceGarages = {
    { ['x'] = 424.1455, ['y'] = -1023.361, ['z'] = 28.92278, ['h'] = 300.83587 },
    { ['x'] = -459.241, ['y'] = 6002.0151, ['z'] = 31.342147, ['h'] = 200.63348 },
    { ['x'] = -439.5925, ['y'] = 6029.1791, ['z'] = 31.340551, ['h'] = 274.22802 },
    { ['x'] = 1855.5954, ['y'] = 3674.6323, ['z'] = 33.661075, ['h'] = 30.010299 },
    { ['x'] = 293.09509, ['y'] = -581.854, ['z'] = 43.193058, ['h'] = 152.69309 },
    { ['x'] = 293.09509, ['y'] = -581.854, ['z'] = 43.193058, ['h'] = 152.69309 },
    { ['x'] = 1855.0419, ['y'] = 2587.0893, ['z'] = 45.106185, ['h'] = 110.52773 },
    { ['x'] = -342.9639, ['y'] = -136.1628, ['z'] = 39.009616, ['h'] = 270.94482 },
    { ['x'] = -211.3267, ['y'] = -1326.596, ['z'] = 30.89038, ['h'] = 261.77297 },
    { ['x'] = 731.14245, ['y'] = -1088.785, ['z'] = 22.163265, ['h'] = 300.03933 },
	{ ['x'] = -1629.60, ['y'] = -1141.96, ['z'] = 0.86, ['h'] = 146.34 },
	{ ['x'] = -2814.367, ['y'] = 2380.24, ['z'] = 0.31, ['h'] = 65.84 },
	{ ['x'] = -641.04, ['y'] = 6357.82, ['z'] = -0.23, ['h'] = 61.35 },
	{ ['x'] = 1543.67, ['y'] = 3900.56, ['z'] = 30.43, ['h'] = 143.82 },
    { ['x'] = -1152.35, ['y'] = -846.11, ['z'] = 3.75, ['h'] = 301.09 },
    { ['x'] = 391.71618, ['y'] = -1614.362, ['z'] = 29.292041, ['h'] = 56.466861 },
    { ['x'] = 370.07208, ['y'] = -1611.636, ['z'] = 29.292043, ['h'] = 64.074371 },
    { ['x'] = -382.0825, ['y'] = -361.5009, ['z'] = 24.044311, ['h'] = 356.8955 }, -- RHPD
    { ['x'] = -381.885, ['y'] = -343.9003, ['z'] = 24.0449, ['h'] = 30.977815 }, -- RHPD
    { ['x'] = -409.6369, ['y'] = -338.7332, ['z'] = 31.895175, ['h'] = 81.621093 }, -- RHPD
    { ['x'] = -425.6322, ['y'] = -332.3329, ['z'] = 32.396396, ['h'] = 349.40924 }, -- RHPD
    { ['x'] = -429.0833, ['y'] = -359.3806, ['z'] = 32.285308, ['h'] = 353.11575 }, -- RHPD
    { ['x'] = -386.7851, ['y'] = -379.022, ['z'] = 31.020193, ['h'] = 81.227264 }, -- RHPD
    { ['x'] = -353.2897, ['y'] = -382.7031, ['z'] = 29.933935, ['h'] = 72.21009 }, -- RHPD
    { ['x'] = -326.2408, ['y'] = -371.4068, ['z'] = 29.391399, ['h'] = 127.29949 }, -- RHPD
    { ['x'] = -333.4013, ['y'] = -352, ['z'] = 29.494245, ['h'] = 228.89038 }, -- RHPD
    { ['x'] = -350.5516, ['y'] = -338.1407, ['z'] = 30.235921, ['h'] = 230.89103 }, -- RHPD
    { ['x'] = -385.7263, ['y'] = -312.2582, ['z'] = 32.534584, ['h'] = 235.84771 }, -- RHPD
    { ['x'] = -414.3408, ['y'] = -298.8266, ['z'] = 34.007644, ['h'] = 255.98101 }, -- RHPD
    { ['x'] = 1830.7944, ['y'] = 3688.6088, ['z'] = 33.974605, ['h'] = 132.42871 }
}

function IsNearPoliceGarage()
    local plyPed = PlayerPedId()
    local plyCoords = GetEntityCoords(plyPed)

    for k,v in pairs(PoliceGarages) do
        local distance = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y,plyCoords.z, v.x, v.y, v.z)
        if distance < 100 then
            return true
        end
    end

    return false
end

RegisterCommand('propfix', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

RegisterNetEvent('police:unmask')
AddEventHandler('police:unmask', function()
	local t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 5) then

        if not IsPedInVehicle(t,GetVehiclePedIsIn(t, false),false) then
			TriggerServerEvent("police:unmaskGranted", GetPlayerServerId(t))
			AnimSet = "mp_missheist_ornatebank"
			AnimationOn = "stand_cash_in_bag_intro"
			AnimationOff = "stand_cash_in_bag_intro"
			loadAnimDict( AnimSet )
			TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 8.0, -8, -1, 49, 0, 0, 0, 0 )
			Citizen.Wait(500)
			ClearPedTasks(PlayerPedId())						
		end
	else
		QBCore.Functions.Notify("No player nearby.", "error")
	end
end)


RegisterNetEvent("qb-police:interact:lockedstash", function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "PD_"..plate, {
        maxweight = 75000,
        slots = 10,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "PD_"..plate)
end)

RegisterNetEvent('police:unmaskAccepted')
AddEventHandler('police:unmaskAccepted', function()
    TriggerEvent('clothing:setupCommandsData')

    loadAnimDict("missheist_agency2ahelmet")
    TaskPlayAnim(PlayerPedId(), "missheist_agency2ahelmet", "take_off_helmet_stand", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0 )
    Wait(800)
    SetPedComponentVariation(PlayerPedId(), 1, -1, -1, -1)
    ClearPedProp(PlayerPedId(), 0)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('police:unmask')
AddEventHandler('police:unmask', function()
	local t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 5) then

        if not IsPedInVehicle(t,GetVehiclePedIsIn(t, false),false) then
			TriggerServerEvent("police:unmaskGranted", GetPlayerServerId(t))
			AnimSet = "mp_missheist_ornatebank"
			AnimationOn = "stand_cash_in_bag_intro"
			AnimationOff = "stand_cash_in_bag_intro"
			loadAnimDict( AnimSet )
			TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 8.0, -8, -1, 49, 0, 0, 0, 0 )
			Citizen.Wait(500)
			ClearPedTasks(PlayerPedId())						
		end
	else
		QBCore.Functions.Notify("No player nearby.", "error")
	end
end)

RegisterNetEvent('police:LockedCompartment')
AddEventHandler('police:LockedCompartment', function()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name == "police" and IsPedInAnyPoliceVehicle(PlayerPedId()) then
    QBCore.Functions.Progressbar("unlocked", "Unlocking..", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
    TriggerEvent("qb-police:interact:lockedstash")
    end, function() -- Cancelled 
    end)
    else
        QBCore.Functions.Notify("You are not a cop / not in a police vehicle.", "error")
    end
end)
