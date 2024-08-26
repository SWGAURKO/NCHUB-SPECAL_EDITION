-- Variables
QBCore = exports['qb-core']:GetCoreObject()
isHandcuffed = false
cuffType = 1
isEscorted = false
draggerId = 0
PlayerJob = {}
onDuty = false
local DutyBlips = {}

-- Functions
local position, nameHash = GetInteriorLocationAndNamehash(7170)


RegisterNetEvent('police:chatMessage')
AddEventHandler('police:chatMessage', function(data)
    if not QBCore or not QBCore.Functions.GetPlayerData().job or QBCore.Functions.GetPlayerData().job.name ~= 'police' or not QBCore.Functions.GetPlayerData().job.onduty then
        return
    end

    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message server" style="background-color: rgba(52, 67, 235, 0.75);"><b>Police Chat - {0}:</b> {1}</div>',
        args = data
    })
end)

local function CreateDutyBlips(playerId, playerLabel, playerJob, playerLocation)
    local ped = GetPlayerPed(playerId)
    local blip = GetBlipFromEntity(ped)
    if not DoesBlipExist(blip) then
        if NetworkIsPlayerActive(playerId) then
            blip = AddBlipForEntity(ped)
        else
            blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
        end
        SetBlipSprite(blip, 1)
        ShowHeadingIndicatorOnBlip(blip, true)
        SetBlipRotation(blip, math.ceil(playerLocation.w))
        SetBlipScale(blip, 0.8)
        if playerJob == "police" then
            SetBlipColour(blip, 38)
        else
            SetBlipColour(blip, 5)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(playerLabel)
        EndTextCommandSetBlipName(blip)
        DutyBlips[#DutyBlips+1] = blip
    end

    if GetBlipFromEntity(PlayerPedId()) == blip then
        -- Ensure we remove our own blip.
        RemoveBlip(blip)
    end
end

-- Events

AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        local player = QBCore.Functions.GetPlayerData()
        PlayerJob = player.job
        onDuty = player.job.onduty
        isHandcuffed = false
        TriggerServerEvent("QBCore:Server:SetMetaData", "ishandcuffed", false)
        TriggerServerEvent("police:server:SetHandcuffStatus", false)
        TriggerServerEvent("police:server:UpdateBlips")
        TriggerServerEvent("police:server:UpdateCurrentCops")
    
        if player.metadata.tracker then
            local trackerClothingData = {
                outfitData = {
                    ["accessory"] = {
                        item = 13,
                        texture = 0
                    }
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
        else
            local trackerClothingData = {
                outfitData = {
                    ["accessory"] = {
                        item = -1,
                        texture = 0
                    }
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
        end
    
        if PlayerJob and PlayerJob.name ~= "police" then
            if DutyBlips then
                for k, v in pairs(DutyBlips) do
                    RemoveBlip(v)
                end
            end
            DutyBlips = {}
        end
    end
end)

local PoliceEvidence = {
    [1] = { ['x'] = -385.492, ['y'] = -417.9434, ['z'] = 25.098129, ['h'] = 179.32073 }
}

function CanOpenEvidence()
    local plyPed = PlayerPedId()
    local plyCoords = GetEntityCoords(plyPed)
    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
    local vehicle = QBCore.Functions.GetClosestVehicle()

    --[[
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(vehicle)
        local newpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
        local disatance = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y,plyCoords.z,newpos.x, newpos.y, newpos.z)
        if disatance < 2 then
            return true
        end
    end]]

    for k,v in pairs(PoliceEvidence) do
        local distance = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y,plyCoords.z,v.x, v.y, v.z)
        if distance < 2.5 then
            return true
        end
    end

    return false
end

RegisterNetEvent('police:evidence')
AddEventHandler('police:evidence', function(box)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policestash2_" .. box)
    TriggerEvent("inventory:client:SetCurrentStash", "policestash2_" .. box)
end)


RegisterNetEvent('police:client:openLockedStorage', function()
    if PlayerJob.name == 'police' and onDuty then
        QBCore.Functions.Progressbar('locked_storage', 'Unlocking...', 2500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local model = GetEntityModel(veh)
            if model == -1336796853 or model == -1109563416 or model == -901056903 or model == -1457394361 or model == 719025956 or model == 1949729657 then
                local plate = GetVehicleNumberPlateText(veh)
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "Locked_Compartment_"..plate, {
                    maxweight = 250000,
                    slots = 10,
                })
                TriggerEvent("inventory:client:SetCurrentStash", "Locked_Compartment_"..plate)
            else
                QBCore.Functions.Notify('You are not in a police vehicle!', 'error')
            end
        end, function()
            QBCore.Functions.Notify(Lang:t("error.cancelled"), "error")
        end)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
    isHandcuffed = false
    TriggerServerEvent("QBCore:Server:SetMetaData", "ishandcuffed", false)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateBlips")
    TriggerServerEvent("police:server:UpdateCurrentCops")

    if player.metadata.tracker then
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = 13,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    else
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = -1,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    end

    if PlayerJob and PlayerJob.name ~= "police" then
        if DutyBlips then
            for k, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('police:server:UpdateBlips')
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateCurrentCops")
    isHandcuffed = false
    isEscorted = false
    onDuty = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    if DutyBlips then
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    TriggerServerEvent("police:server:UpdateBlips")
    if JobInfo.name == "police" then
        if PlayerJob.onduty then
            TriggerServerEvent("QBCore:ToggleDuty")
            onDuty = false
        end
    end

    if (PlayerJob ~= nil) and PlayerJob.name ~= "police" then
        if DutyBlips then
            for k, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('police:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr."
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Mrs."
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Central Judicial Collection Agency",
            subject = "Debt collection",
            message = "Dear " .. gender .. " " .. charinfo.lastname ..
                ",<br /><br />The Central Judicial Collection Agency (CJCA) charged the fines you received from the police.<br />There is <strong>$" ..
                amount .. "</strong> withdrawn from your account.<br /><br />Kind regards,<br />Mr. I.K. Graai",
            button = {}
        })
    end)
end)

RegisterNetEvent('police:client:UpdateBlips', function(players)
    if PlayerJob and (PlayerJob.name == 'police' or PlayerJob.name == 'ambulance') and
        PlayerJob.onduty then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
        if players then
            for _, data in pairs(players) do
                local id = GetPlayerFromServerId(data.source)
                CreateDutyBlips(id, data.label, data.job, data.location)

            end
        end
    end
end)

RegisterNetEvent('police:client:policeAlert', function(coords, text)
    local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1name = GetStreetNameFromHashKey(street1)
    local street2name = GetStreetNameFromHashKey(street2)
    QBCore.Functions.Notify({text = text, caption = street1name.. ' ' ..street2name}, 'police')
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blipText = 'Police Alert - ' ..text
    SetBlipSprite(blip, 60)
    SetBlipSprite(blip2, 161)
    SetBlipColour(blip, 1)
    SetBlipColour(blip2, 1)
    SetBlipDisplay(blip, 4)
    SetBlipDisplay(blip2, 8)
    SetBlipAlpha(blip, transG)
    SetBlipAlpha(blip2, transG)
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 1.0)
    SetBlipAsShortRange(blip, false)
    SetBlipAsShortRange(blip2, false)
    PulseBlip(blip2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        if transG == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

RegisterNetEvent('police:client:SendToJail', function(time)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

-- NUI

-- Threads

CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 526)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 3)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)



local PoliceGarages = {
    { ['x'] = 424.1455, ['y'] = -1023.361, ['z'] = 28.92278, ['h'] = 300.83587 }, ---MRPD
    { ['x'] = 293.09509, ['y'] = -581.854, ['z'] = 43.193058, ['h'] = 152.69309 }, ---PILLBOX
    { ['x'] = -459.241, ['y'] = 6002.0151, ['z'] = 31.342147, ['h'] = 200.63348 }, ---Polito pd
    { ['x'] = -439.5925, ['y'] = 6029.1791, ['z'] = 31.340551, ['h'] = 274.22802 }, ----palito hospital
    { ['x'] = 1855.5954, ['y'] = 3674.6323, ['z'] = 33.661075, ['h'] = 30.010299 } ----Prision
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

exports['qb-target']:AddBoxZone("PDclot", vector3(461.88088, -995.4263, 30.26522), 2.5, 2.5, {
    name = "PDclot",
    heading = 359,
    debugPoly = false,
    minZ = 29.728078,
    maxZ = 33.87834,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
            job = "police",
        },
        -- {
        --     type = "client",
        --     event = "qb-pedsclothing:client:openMenu",
        --     icon = "fas fa-sign-in-alt",
        --     label = "Open Peds Menu",
        --     job = "police",
        -- },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("SANDYCLOT", vector3(1852.8336, 3689.6564, 30.018318), 2.5, 2.5, {
    name = "SANDYCLOT",
    heading = 359,
    debugPoly = false,
    minZ = 29.018318,
    maxZ = 31.018318,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
            job = "police",
        },
        -- {
        --     type = "client",
        --     event = "qb-pedsclothing:client:openMenu",
        --     icon = "fas fa-sign-in-alt",
        --     label = "Open Peds Menu",
        --     job = "police",
        -- },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("PDclot2", vector3(-399.1743, -369.7565, 25.03203), 2.5, 2.5, {
    name = "PDclot2",
    heading = 359,
    debugPoly = false,
    minZ = 24.03203,
    maxZ = 26.03203,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
            job = "police",
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("PRISONCLOTHINGASIS", vector3(3907.174, 39.187313, 24.396623), 2.5, 2.5, {
    name = "PRISONCLOTHINGASIS",
    heading = 359,
    debugPoly = false,
    minZ = 23.396623,
    maxZ = 25.396623,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("bennys", vector3(451.46475, -973.9951, 25.699989), 2.5, 2.5, {
    name = "bennys",
    heading = 359,
    debugPoly = false,
    minZ = 23.699989,
    maxZ = 26.699989,
}, {
    options = {
        {
            type = "client",
            event = "event:control:pdbennys",
            icon = "fas fa-sign-in-alt",
            label = "Open Bennys ( Police Cars Only )",
            job = "police",
        },
    },
    distance = 5.5
})

exports['qb-target']:AddBoxZone("bennyssandy", vector3(1882.6596, 3701.4758, 33.541908), 2.5, 2.5, {
    name = "bennyssandy",
    heading = 359,
    debugPoly = false,
    minZ = 32.541908,
    maxZ = 34.541908,
}, {
    options = {
        {
            type = "client",
            event = "event:control:SANDYbennys",
            icon = "fas fa-sign-in-alt",
            label = "Open Bennys ( Police Cars Only )",
            job = "police",
        },
    },
    distance = 5.5
})

exports['qb-target']:AddBoxZone("prisonclot", vector3(3877.7629, -23.37797, 6.5956535), 2.5, 2.5, {
    name = "prisonclot",
    heading = 359,
    debugPoly = false,
    minZ = 5.5956535,
    maxZ = 7.5956535,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
            job = "corrections",
        },
    },
    distance = 2.5
})

-- exports['qb-target']:AddBoxZone("SheriffBadge", vector3(603.05633, 13.329235, 82.741119), 1.1, 1.2, {
--     name = "Sheriff Badge",
--     heading=300,
--     debugPoly = false,
-- }, {
--     options = {
--         {
--             type = "server",
--             event = "qb-badge:server:createbadge",
--             icon = "fas fa-sign-in-alt",
--             label = "Create Badge",
--             job = "police",
--         },
--     },
--     distance = 2.5
-- })

-- VPD

exports['qb-target']:AddBoxZone("VPDcloth", vector3(551.70843, 27.71268, 69.357208), 2.5, 2.5, {
    name = "VPDcloth",
    heading = 359,
    debugPoly = false,
    minZ = 68.357208,
    maxZ = 70.357208,
}, {
    options = {
        {
            type = "client",
            event = "qb-clothing:client:openMenu",
            icon = "fas fa-sign-in-alt",
            label = "Open Clothing Menu",
            job = "police",
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("VPDbennys", vector3(546.01281, 9.0272827, 69.510948), 2.5, 2.5, {
    name = "VPDbennys",
    heading = 359,
    debugPoly = false,
    minZ = 68.510948,
    maxZ = 70.510948,
}, {
    options = {
        {
            type = "client",
            event = "event:control:vpdbennys",
            icon = "fas fa-sign-in-alt",
            label = "Open Bennys ( Police Cars Only )",
            job = "police",
        },
    },
    distance = 5.5
})

--

RegisterNetEvent('police:livery', function(livery)

    if not IsNearPoliceGarage() then
        return
    end

    local plyPed = PlayerPedId()
    if IsPedInAnyVehicle(plyPed) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())

        if GetVehicleLiveryCount(vehicle) == -1 then
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">SYSTEM: {0}</div>',
                args = { 'Vehicle dont have any liveries' }
            })
            return
        end

        if livery and GetVehicleLiveryCount(vehicle) >= livery then
            SetVehicleLivery(vehicle, livery, true)
            return
        else
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">Available Liveries: {0}</div>',
                args = { GetVehicleLiveryCount(vehicle) }
            })
            return
        end
    
    else
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'You have to be in vehicle' }
        })
        return
    end
end)

RegisterCommand('duty', function()
    local playerData = QBCore.Functions.GetPlayerData()
    local playerJob = playerData.job.name
    -- onDuty = not onDuty
    if playerJob == "police" then
    onDuty = not onDuty    
    TriggerServerEvent("police:server:UpdateCurrentCops")
    TriggerEvent('ws-10system:Client:Duty',onDuty)
    TriggerServerEvent("QBCore:ToggleDuty")
    TriggerServerEvent("police:server:UpdateBlips")
else
    QBCore.Functions.Notify('The command only for police! - you must to be a police officer.', 'error')
end
end)

