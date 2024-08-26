Framework = nil
Framework = GetFramework()
Citizen.Await(Framework)
-- Callback = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.TriggerServerCallback or Framework.Functions.TriggerCallback

if Config.Framework == "ESX" or Config.Framework == "NewESX" then
            Framework.RegisterServerCallback("isPrice", function(source, cb, money, payment )
                local Player = Framework.GetPlayerFromId(source)
                if payment == 'cash' then 
                    if Player.getMoney() >= tonumber(money) then 
                        Player.removeMoney(tonumber(money))
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    if Player.getAccount('bank').money >= tonumber(money) then 
                        Player.removeAccountMoney('bank', tonumber(money))  
                        cb(true)
                    else
                        cb(false)
                    end
                end
            end)
        
elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.CreateCallback("isPrice", function(source, cb, money, payment)
            local Player = Framework.Functions.GetPlayer(source)
            if payment == 'cash' then 
                if Player.Functions.RemoveMoney('cash', money) then
                    cb(true)
                else
                    cb(false)
                end
            else 
                if Player.Functions.RemoveMoney('bank', money) then
                    cb(true)
                else
                    cb(false)
                end
            end
        end)

end


RegisterServerEvent('vehicleshop:setVehicleOwned', function(Plate, Props, Model)
    local Player = Framework.Functions.GetPlayer(source)
    if GetResourceState('oxmysql') == 'started' then
        exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?) ', {Player.PlayerData.license, Player.PlayerData.citizenid, Model, GetHashKey(Model), json.encode(Props), Plate, 0})
    elseif GetResourceState('ghmattimysql') == 'started' then
        exports.ghmattimysql:execute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?) ', {Player.PlayerData.license, Player.PlayerData.citizenid, Model, GetHashKey(Model), json.encode(Props), Plate, 0})
    elseif GetResourceState('mysql-async') == 'started' then
        MySQL.Async.execute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?) ', {Player.PlayerData.license, Player.PlayerData.citizenid, Model, GetHashKey(Model), json.encode(Props), Plate, 0})
    end
    TriggerClientEvent('QBCore:Notify', source, 'Congratulations on your purchase!', 'success')
end)