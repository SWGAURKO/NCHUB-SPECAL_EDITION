QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-prisonrental:attemptPurchase')
AddEventHandler('qb-prisonrental:attemptPurchase', function(car,price)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= price then
        Player.Functions.RemoveMoney("bank",price,"rentals")
        TriggerClientEvent('qb-prisonrental:vehiclespawn', source, car)
       -- local fuelLevel = exports["cdn-fuel"]:SetFuel(vehicle)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to receive 50% of the total costs.", "success")
    else
        TriggerClientEvent('qb-prisonrental:attemptvehiclespawnfail', source)
    end
end)

RegisterServerEvent('qb-prisonrental:attemptPurchase2')
AddEventHandler('qb-prisonrental:attemptPurchase2', function(car,price)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= price then
        Player.Functions.RemoveMoney("bank",price,"rentals")
        TriggerClientEvent('qb-prisonrental:vehiclespawn2', source, car)
        --local fuelLevel = exports["cdn-fuel"]:SetFuel(vehicle)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to receive 50% of the total costs.", "success")
    else
        TriggerClientEvent('qb-prisonrental:attemptvehiclespawnfail', source)
    end
end)

RegisterServerEvent('qb-prisonrental:giverentalpaperServer')
AddEventHandler('qb-prisonrental:giverentalpaperServer', function(model, plateText)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        label = plateText
    }
    Player.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rentalpapers'], "add")
end)

RegisterServerEvent('qb-prisonrental:server:payreturn')
AddEventHandler('qb-prisonrental:server:payreturn', function(model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    for k,v in pairs(Config.vehicleList) do 
        if string.lower(v.model) == model then
            local payment = v.price / 2
            Player.Functions.AddMoney("bank",payment,"rental-return")
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle and received $" .. payment .. " in return.", "success")
        end
    end
end)

QBCore.Functions.CreateCallback('qb-prisonrental:server:hasrentalpapers', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rentalpapers")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)