local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)


RegisterCommand('id', function(source, args, rawCommand)
	local src = source
	TriggerClientEvent('QBCore:Notify', src, 'Your ID is: ' ..src.. '', 'error')
end, false)

QBCore.Functions.CreateUseableItem("harness", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('seatbelt:client:UseHarness', src, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items[item.slot].info.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['harness'], "remove")
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

AddEventHandler("entityCreating", function(handle)
    local entityModel = GetEntityModel(handle)

    if Config.BlacklistedVehs[entityModel] or Config.BlacklistedPeds[entityModel] then
        CancelEvent()
    end
end)

RegisterNetEvent('qb-carwash:server:washCar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif Player.Functions.RemoveMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money..', 'error')
    end
end)

QBCore.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)

QBCore.Commands.Add('pfix', 'Fix Vehicle (Police Only)', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and (Player.PlayerData.job.name == 'police' or Player.PlayerData.job.name == 'ambulance') then
        TriggerClientEvent('police:fix', src)
    else
        TriggerClientEvent('chat:addMessage', src, {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'This command is for emergency services!' }
        })
    end 
end)



QBCore.Commands.Add('emschat', 'Send message to the active ems', { { name = "message", help = "Content" } }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and (Player.PlayerData.job.name == 'ambulance' and Player.PlayerData.job.onduty) then
        TriggerClientEvent('ems:chatMessage', -1, {(Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname), table.concat(args, " ")})
    else
        TriggerClientEvent('QBCore:Notify', source, "You must to be an ems.", "error")
    end
end)

RegisterServerEvent("police:unmaskGranted")
AddEventHandler("police:unmaskGranted", function(player)
    TriggerClientEvent('police:unmaskAccepted', player)
end)


