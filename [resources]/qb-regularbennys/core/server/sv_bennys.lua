QBCore = exports['qb-core']:GetCoreObject()
local nchubbb = "mechanic"
local chicken = vehicleBaseRepairCost
local getAccountMoney = 0
local function isPoliceMan(Player, price, currentBennys) 
    local src = source
    if Player.PlayerData.job.name == nchubbb then
        if price % 2 == 0 then
            price = price / 2
        end
    end        
        local result = exports.oxmysql:scalarSync('SELECT amount FROM bossmenu WHERE job_name = ?',{nchubbb})
        if result > price then
            exports.oxmysql:executeSync('UPDATE `bossmenu` SET `amount` = ? WHERE `job_name` = ?', { result - price, nchubbb })
            TriggerClientEvent('qb-bennys:purchaseSuccessful', src)
        else
            TriggerClientEvent('qb-bennys:purchaseFailedpolice', src)

        if Player.PlayerData.money.cash >= price then
            -- Player.Functions.RemoveMoney('cash', price)
            exports['qb-management']:RemoveMoney(nchubbb, price)
            TriggerClientEvent('qb-bennys:purchaseSuccessful', src)
        else
            TriggerClientEvent('qb-bennys:purchaseFailed', src)
        end
    end
end

RegisterServerEvent('qb-bennys:attemptPurchase')
AddEventHandler('qb-bennys:attemptPurchase', function(type, upgradeLevel, currentBennys)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if type == "repair" then
        isPoliceMan(Player, chicken, currentBennys)
    elseif type == "performance" then
        isPoliceMan(Player, vehicleCustomisationPrices[type].prices[upgradeLevel], currentBennys)
    else
        isPoliceMan(Player, vehicleCustomisationPrices[type].price, currentBennys)
    end
end)

RegisterServerEvent('qb-bennys:updateRepairCost')
AddEventHandler('qb-bennys:updateRepairCost', function(cost)
    chicken = cost
end)

RegisterServerEvent("updateVehicle")
AddEventHandler("updateVehicle", function(myCar)
	local src = source
    if IsVehicleOwned(myCar.plate) then
        exports.oxmysql:executeSync('UPDATE `player_vehicles` SET `mods` = ? WHERE `plate` = ?', { json.encode(myCar), myCar.plate })
    end
end)

function IsVehicleOwned(plate)
    local result = exports.oxmysql:scalarSync('SELECT plate FROM `player_vehicles` WHERE `plate` = ?', { plate })

    return result == nil and false or true
end