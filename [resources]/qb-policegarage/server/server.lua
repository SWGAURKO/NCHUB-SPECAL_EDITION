local QBCore = exports['qb-core']:GetCoreObject()

local isActive = false

discord = {
    ['webhook'] = "https://discord.com/api/webhooks/1115670714998071447/5da9Qgu289kBLEXJcTl4lXX03PaHVQc_ed_K0D-P6DWhETC6yjynyl810q_cf_UlxJUy",
    ['name'] = 'Police Garage Logs',
    ['image'] = "https://cdn.discordapp.com/attachments/894587508682268763/1166653398079254548/a6280111eb611640.png?ex=654b45a5&is=6538d0a5&hm=d16f3dbe05c5e82fc21faa4bdbea769416dd0d0c72ea2db5c8c8fb071ecf63bb&"
}

function DiscordLog(name, message, color)
    local embed = {
        {
            ["color"] = 04255, 
            ["title"] = "NCHub Police Garage",
            ["description"] = message,
            ["url"] = "https://discord.gg/36wbxTXT",
            ["footer"] = {
            ["text"] = "NCHub",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/894587508682268763/1166653398079254548/a6280111eb611640.png?ex=654b45a5&is=6538d0a5&hm=d16f3dbe05c5e82fc21faa4bdbea769416dd0d0c72ea2db5c8c8fb071ecf63bb&"
        },
            ["thumbnail"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/894587508682268763/1166653398079254548/a6280111eb611640.png?ex=654b45a5&is=6538d0a5&hm=d16f3dbe05c5e82fc21faa4bdbea769416dd0d0c72ea2db5c8c8fb071ecf63bb&",
            },
    }
}
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = embed, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end

QBCore.Functions.CreateCallback('qb-policegarage:CheckIfActive', function(source, cb)
    local src = source

    if not isActive then
        TriggerEvent("qb-policegarage:server:SetActive", true)
        cb(true)
    else
        cb(false)
        TriggerClientEvent("QBCore:Notify", src, "Someone Is In The Menu Please Wait !", "error")
    end
end)

RegisterNetEvent('qb-policegarage:server:SetActive', function(status)
    if status ~= nil then
        isActive = status
        TriggerClientEvent('qb-policegarage:client:SetActive', -1, isActive)
    else
        TriggerClientEvent('qb-policegarage:client:SetActive', -1, isActive)
    end
end)

RegisterServerEvent("qb-policegarage:AddVehicleSQL")
AddEventHandler('qb-policegarage:AddVehicleSQL', function(mods, vehicle, hash, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        vehicle,
        hash,
        json.encode(mods),
        plate,
        0
    })
end)

RegisterServerEvent('qb-policegarage:TakeMoney', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.bank >= data.price then
        TriggerClientEvent("qb-policegarage:SpawnVehicle", src, data.vehicle)  
        Player.Functions.RemoveMoney("bank", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

RegisterServerEvent('qb-policegarage:TakeMoney2', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.bank >= data.price then
        TriggerClientEvent("qb-policegarage:SpawnVehicle2", src, data.vehicle)  
        Player.Functions.RemoveMoney("bank", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

RegisterServerEvent('qb-policegarage:TakeMoney3', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.bank >= data.price then
        TriggerClientEvent("qb-policegarage:SpawnVehicle3", src, data.vehicle)  
        Player.Functions.RemoveMoney("bank", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

RegisterServerEvent('qb-policegarage:TakeMoney4', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.bank >= data.price then
        TriggerClientEvent("qb-policegarage:SpawnVehicle4", src, data.vehicle)  
        Player.Functions.RemoveMoney("bank", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

RegisterServerEvent('qb-policegarage:TakeMoney5', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.bank >= data.price then
        TriggerClientEvent("qb-policegarage:SpawnVehicle5", src, data.vehicle)  
        Player.Functions.RemoveMoney("bank", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)