QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-pboat:attemptPurchase')
AddEventHandler('qb-pboat:attemptPurchase', function(car,price)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= price then
        Player.Functions.RemoveMoney("bank",price,"rentals")
        TriggerClientEvent('qb-pboat:vehiclespawn', source, car)
       -- local fuelLevel = exports["cdn-fuel"]:SetFuel(vehicle)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to receive 50% of the total costs.", "success")
    else
        TriggerClientEvent('qb-pboat:attemptvehiclespawnfail', source)
    end
end)

RegisterServerEvent('qb-pboat:attemptPurchase2')
AddEventHandler('qb-pboat:attemptPurchase2', function(car,price)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= price then
        Player.Functions.RemoveMoney("bank",price,"rentals")
        TriggerClientEvent('qb-pboat:vehiclespawn2', source, car)
        --local fuelLevel = exports["cdn-fuel"]:SetFuel(vehicle)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to receive 50% of the total costs.", "success")
    else
        TriggerClientEvent('qb-pboat:attemptvehiclespawnfail', source)
    end
end)

RegisterServerEvent('qb-pboat:giverentalpaperServer')
AddEventHandler('qb-pboat:giverentalpaperServer', function(model, plateText)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        label = plateText
    }
    Player.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rentalpapers'], "add")
end)

RegisterServerEvent('qb-pboat:server:payreturn')
AddEventHandler('qb-pboat:server:payreturn', function(model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    for k,v in pairs(Config.BoatList) do 
        if string.lower(v.model) == model then
            local payment = v.price / 2
            Player.Functions.AddMoney("bank",payment,"rental-return")
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle and received $" .. payment .. " in return.", "success")
        end
    end
end)

QBCore.Functions.CreateCallback('qb-pboat:server:hasrentalpapers', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rentalpapers")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)