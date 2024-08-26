Outfits = {}
local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    Wait(500)
    local fetch = json.decode(LoadResourceFile(GetCurrentResourceName(), "./database.json"))
    if fetch then
        Outfits = fetch
    end
end)

RegisterServerEvent("qb-outfits:server:createOutfit")
AddEventHandler("qb-outfits:server:createOutfit", function(slot, data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local citizenid = xPlayer.PlayerData.citizenid
    local slot = tonumber(slot)
    local char = xPlayer.PlayerData.citizenid

    if not slot then
        return
    end

    if not Outfits[citizenid] then
        Outfits[citizenid] = {}
    end

    MySQL.Async.fetchAll("SELECT * FROM playersTattoos WHERE citizenid = '" .. char .. "'", {}, function(result)
        if(#result > 0) then
            data['tats'] = json.decode(result[1].tattoos)
            MySQL.Async.fetchAll("UPDATE playersTattoos SET tattoos = '{}' WHERE citizenid = '" .. char .. "'")
        else
            data['tats'] = {}
			MySQL.Async.fetchAll("INSERT INTO playersTattoos (citizenid, tattoos) VALUES ('" .. char .. "', '{}')")
        end
    end)

    while not data['tats'] do
        Wait(1)
    end

    if not Outfits[citizenid][slot] then
        Outfits[citizenid][slot] = { outfit = data }
    end

    TriggerClientEvent("QBCore:Notify",src, "Saved outfit number " .. slot)
    SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
end)

RegisterServerEvent("qb-outfits:server:delete")
AddEventHandler("qb-outfits:server:delete", function(data)
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    local slot   = tonumber(data.slot)

    if not slot or not Outfits[Player.PlayerData.citizenid] then
        return
    end

    if Outfits[Player.PlayerData.citizenid][slot] then
        Outfits[Player.PlayerData.citizenid][slot] = nil
    end

    TriggerClientEvent("QBCore:Notify",src, "Deleted outfit number " .. slot, "error")
    SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
end)

RegisterServerEvent("qb-outfits:server:setOutfit")
AddEventHandler("qb-outfits:server:setOutfit", function(data)
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    local slot   = tonumber(data.slot)

    if not slot or not Outfits[Player.PlayerData.citizenid] then
        return
    end

    if Outfits[Player.PlayerData.citizenid][slot] then
        local outfit = Outfits[Player.PlayerData.citizenid][slot]['outfit']
        TriggerClientEvent("qb-outfits:client:SetClothing", src, outfit)
    end
end)

QBCore.Commands.Add("outfits", "Outfits Menu", {}, false, function(source, args)
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    local force  = false

    if(#args == 1 and args[1] == "--force") then
        force = true
    end

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if(Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        return TriggerClientEvent("QBCore:Notify", source, "You don't have any outfits.", "error")
    end

    TriggerClientEvent("qb-outfits:client:openMenu", src, Outfits[Player.PlayerData.citizenid])
end)

RegisterServerEvent("OriDN:outfitsCommand")
AddEventHandler("OriDN:outfitsCommand", function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local force = false

    if (#args == 1 and args[1] == "--force") then
        force = true
    end

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if (Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        TriggerClientEvent("QBCore:Notify", src, "You don't have any outfits.", "error")
    else
        TriggerClientEvent("qb-outfits:client:openMenu", src, Outfits[Player.PlayerData.citizenid])
    end
end)

RegisterNetEvent("qb-outfits:server:openUI")
AddEventHandler("qb-outfits:server:openUI", function()
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    local force  = false

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if(Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        return TriggerClientEvent("QBCore:Notify", source, "You don't have any outfits.", "error")
    end

    TriggerClientEvent("qb-outfits:client:openMenu", src, Outfits[Player.PlayerData.citizenid])
end)

RegisterNetEvent("qb-outfits:server:OpenTrunk")
AddEventHandler("qb-outfits:server:OpenTrunk", function()
    local src    = source
    local Player = QBCore.Functions.GetPlayer(src)
    local force  = false

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if(Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        return TriggerClientEvent("QBCore:Notify", source, "You don't have any outfits.", "error")
    end

    TriggerClientEvent("qb-outfits:client:OpenTrunk", src, Outfits[Player.PlayerData.citizenid])
end)

QBCore.Commands.Add("saveoutfit", "Save your outfit", {{name="number", help="Number"}}, true, function(source, args)
    local outfitNumber = tonumber(args[1])

    if(outfitNumber == nil) then
        return TriggerClientEvent("QBCore:Notify", source, "Wrong outfit number [1 - 25]", "error")
    end

    if(outfitNumber <= 0 or outfitNumber > 25) then
        return TriggerClientEvent("QBCore:Notify", source, "Wrong outfit number [1 - 25]", "error")
    end

    TriggerClientEvent("qb-outfits:client:saveOutfit", source, outfitNumber)

end, "user")