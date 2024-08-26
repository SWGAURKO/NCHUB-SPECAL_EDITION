-- Events
RegisterNetEvent('textUi:ShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('textUi:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

RegisterNetEvent('cdclothing:interact:clothing', function(Current)
    TriggerEvent("raid_clothes:hasEnough", "clothesmenu")
end)

RegisterNetEvent('cdclothing:interact:barbermenu', function(Current)
    TriggerEvent("raid_clothes:hasEnough", "barbermenu")
end)

RegisterNetEvent('cdclothing:interact:tattoomenu', function(Current)
    TriggerEvent("raid_clothes:hasEnough", "tattoomenu")
end)

RegisterNetEvent('textUi:ShowText', function(text)
    SendNUIMessage({
		action = 'show',
		text = text,
	})
end)

RegisterNetEvent('textUi:AddText', function(coords, distance, text, key, eventname)
    if DoesTextExist(coords) then return end
    Config.Locations[#Config.Locations+1] = {
        coords = coords,
        distance = distance,
        text = text, 
        key = key,
        eventname = eventname
    }
end)

-- Threads
CreateThread(function()
    local alreadyEnteredZone = false
    local text = nil
    while true do
        local sleep = 500
        local ped = PlayerPedId()
        local inZone = false
        for cd = 1, #Config.Locations do
            local coords = GetEntityCoords(ped)
            local dist = #(GetEntityCoords(ped)-vector3(Config.Locations[cd].coords.x, Config.Locations[cd].coords.y, Config.Locations[cd].coords.z))
            if dist <= Config.Locations[cd].distance then
                sleep = 1
                inZone  = true
                text = Config.Locations[cd].text

                if IsControlJustReleased(0, Config.Locations[cd].key) and Config.Locations[cd].eventname then
                    TriggerEvent(Config.Locations[cd].eventname)
                end
                break
            end
        end

        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            TriggerEvent('textUi:ShowUI', 'show', text)
        end

        if inZone and IsPauseMenuActive() then
            TriggerEvent('textUi:HideUI')
            alreadyEnteredZone = false
        end

        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            TriggerEvent('textUi:HideUI')
        end

        Wait(sleep)
    end
end)

-- Functions
function DoesTextExist(coords)
    local retval = false
    for cd = 1, #Config.Locations do
        if Config.Locations[cd].coords == coords then
            retval = true
            break
        end
    end

    return retval
end

-- Exports
exports('AddText', function(coords, distance, text, key, eventname)
    if DoesTextExist(coords) then return end
    Config.Locations[#Config.Locations+1] = {
        coords = coords,
        distance = distance,
        text = text, 
        key = key,
        eventname = eventname
    }
end)

exports('DrawTextUi', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

exports('HideTextUi', function()
    SendNUIMessage({
		action = 'hide'
	})
end)
