local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nchub-shellgame:server:setstate', function(id, state)
    TriggerClientEvent('nchub-shellgame:client:setstate', -1, id, state)
end)

RegisterNetEvent('nchub-shellgame:server:arrested', function(id, state)
    TriggerClientEvent('nchub-shellgame:client:arrested', -1, id, state)
end)

RegisterNetEvent('nchub-shellgame:server:speech', function(k, speech)
    TriggerClientEvent('nchub-shellgame:client:speech', -1, k, speech)
end)

RegisterNetEvent('nchub-shellgame:server:playanim', function(ped, animdic, anim)
    TriggerClientEvent('nchub-shellgame:client:playanim', -1, ped, animdic, anim)
end)

QBCore.Functions.CreateCallback('nchub-shellgame:server:HasMoney', function(source, cb, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local CashMoneyMoney = Player.PlayerData.money['cash']
    print(CashMoneyMoney)
    if CashMoneyMoney >= amount then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('nchub-shellgame:server:play', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', amount) then
        TriggerClientEvent("QBCore:Notify", src, Lang:t("error.placebet", {value = tostring(amount)}), "error")
    end
end)

RegisterNetEvent('nchub-shellgame:server:win', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = amount * Config.RewardMulti
    if Player.Functions.AddMoney('cash', reward) then
        TriggerClientEvent("QBCore:Notify", src, Lang:t("success.getreward", {value = tostring(Config.RewardMulti), value2 = tostring(reward)}), "success")
    end
end)