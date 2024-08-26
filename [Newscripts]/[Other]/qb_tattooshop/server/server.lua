local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('SmallTattoos:GetPlayerTattoos', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player then
		MySQL.query('SELECT tattoos FROM players WHERE citizenid = ?', {
			Player.PlayerData.citizenid
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

if Config.Core == "ESX" then
    ESX = nil
    if Config.CoreDefine == "" then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent(Config.CoreDefine, function(definedCore)
            ESX = definedCore
        end)
    end

    ESX.RegisterServerCallback("vms_tattooshop:buyTattoo", function(source, cb, currentTattos, collection, idtattoo, price)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and currentTattos and collection and idtattoo then
            local myMoney = xPlayer.getMoney()
            if myMoney >= price then
                currentTattos[#currentTattos + 1] = {collection = collection, texture = idtattoo}
                MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
                    ['@tattoos'] = json.encode(currentTattos),
                    ['@identifier'] = xPlayer.identifier
                })
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["paid"]:format(price), 3950, "success")
                xPlayer.removeMoney(price)
                cb(true)
            else
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["nomoney"], 3950, "error")
            end
        end
    end)

    ESX.RegisterServerCallback('vms_tattooshop:requestPlayerTattoos', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            }, function(result)
                if result[1].tattoos then
                    cb(json.decode(result[1].tattoos))
                else
                    cb()
                end
            end)
        else
            cb()
        end
    end)

elseif Config.Core == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateCallback('vms_tattooshop:buyTattoo', function(source, cb, currentTattos, collection, idtattoo, price)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player and currentTattos and collection and idtattoo then
            local myMoney = Player.Functions.GetMoney('cash')
            if myMoney >= price then
                currentTattos[#currentTattos + 1] = {collection = collection, texture = idtattoo}
                MySQL.Async.execute('UPDATE players SET tattoos = @tattoos WHERE citizenid = @citizenid', {
                    ['@tattoos'] = json.encode(currentTattos),
                    ['@citizenid'] = Player.PlayerData.citizenid
                })
                Player.Functions.RemoveMoney('cash', price)
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["paid"]:format(price), 3950, "success")
                cb(true)
            else
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["nomoney"], 3950, "error")
            end
        end
    end)

    QBCore.Functions.CreateCallback('vms_tattooshop:requestPlayerTattoos', function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            MySQL.Async.fetchAll('SELECT tattoos FROM players WHERE citizenid = @citizenid', {
                ['@citizenid'] = Player.PlayerData.citizenid
            }, function(result)
                if result[1].tattoos then
                    cb(json.decode(result[1].tattoos))
                else
                    cb()
                end
            end)
        else
            cb()
        end
    end)

end

RegisterNetEvent("vms_tattooshop:saveClientTattoos", function(currentTattos)
    if Config.Core == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
            ['@tattoos'] = json.encode(currentTattos),
            ['@identifier'] = xPlayer.identifier
        })
    elseif Config.Core == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        MySQL.Async.execute('UPDATE players SET tattoos = @tattoos WHERE citizenid = @citizenid', {
            ['@tattoos'] = json.encode(currentTattos),
            ['@citizenid'] = Player.PlayerData.citizenid
        })
    end
end)

RegisterNetEvent("vms_tattooshop:removeTattoo", function(currentTattos, removePrice)
    if Config.Core == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and currentTattos then
            local myMoney = xPlayer.getMoney()
            if myMoney >= removePrice then
                MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
                    ['@tattoos'] = json.encode(currentTattos),
                    ['@identifier'] = xPlayer.identifier
                })
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["paid"]:format(removePrice), 3950, "success")
                xPlayer.removeMoney(removePrice)
            else
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["nomoney"], 3950, "error")
            end
        end
    elseif Config.Core == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player and currentTattos then
            local myMoney = Player.Functions.GetMoney('cash')
            if myMoney >= removePrice then
                MySQL.Async.execute('UPDATE players SET tattoos = @tattoos WHERE citizenid = @citizenid', {
                    ['@tattoos'] = json.encode(currentTattos),
                    ['@citizenid'] = xPlayer.identifier
                })
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["paid"]:format(removePrice), 3950, "success")
                Player.Functions.RemoveMoney('cash', removePrice)
            else
                TriggerClientEvent("vms_tattooshop:cl:notification", source, Config.Translate[Config.Lang]["nomoney"], 3950, "error")
            end
        end
    end
end)

RegisterNetEvent("vms_tattooshop:sv:setBusyChair")
AddEventHandler("vms_tattooshop:sv:setBusyChair", function(barberId, chairId, toggle)
    local source = source
    if toggle == true then
        toggle = source
    end
    TriggerClientEvent("vms_tattooshop:cl:setBusyChair", -1, barberId, chairId, toggle)
end)

RegisterNetEvent("vms_tattooshop:sendData")
AddEventHandler("vms_tattooshop:sendData", function(data, plBarberId)
    TriggerClientEvent("vms_tattooshop:openBusiness", plBarberId, data, source)
end)

RegisterNetEvent("vms_tattooshop:getClientSkin")
AddEventHandler("vms_tattooshop:getClientSkin", function(clientId)
    TriggerClientEvent("vms_tattooshop:getData", clientId, source)
end)

RegisterNetEvent("vms_tattooshop:sv:updateClientSkin")
AddEventHandler("vms_tattooshop:sv:updateClientSkin", function(clientId, id, collection)
    TriggerClientEvent("vms_tattooshop:cl:updateClientSkin", clientId, id, collection, source)
end)

RegisterNetEvent("vms_tattooshop:sv:updateTattooerCam")
AddEventHandler("vms_tattooshop:sv:updateTattooerCam", function(tattooer, data)
    TriggerClientEvent("vms_tattooshop:cl:updateTattooerCam", tattooer, data, source)
end)

RegisterNetEvent("vms_tattooshop:sv:closeCam")
AddEventHandler("vms_tattooshop:sv:closeCam", function(clientId)
    TriggerClientEvent("vms_tattooshop:cl:closeCam", clientId)
end)

RegisterNetEvent("vms_tattooshop:sv:loadPlayerSkin")
AddEventHandler("vms_tattooshop:sv:loadPlayerSkin", function(clientId)
    TriggerClientEvent("vms_tattooshop:cl:loadPlayerSkin", clientId)
end)

RegisterNetEvent("vms_tattooshop:sv:buyClient")
AddEventHandler("vms_tattooshop:sv:buyClient", function(clientId, collection, id)
    TriggerClientEvent("vms_tattooshop:cl:buyClient", clientId, collection, id, source)
end)

RegisterNetEvent("vms_tattooshop:sv:removeClient")
AddEventHandler("vms_tattooshop:sv:removeClient", function(clientId, collection, id)
    TriggerClientEvent("vms_tattooshop:cl:removeClient", clientId, collection, id, source)
end)

RegisterNetEvent("vms_tattooshop:sv:sendUpdated")
AddEventHandler("vms_tattooshop:sv:sendUpdated", function(data, currentCollection, tattooer)
    TriggerClientEvent("vms_tattooshop:cl:updateUi", tattooer, data, currentCollection)
end)