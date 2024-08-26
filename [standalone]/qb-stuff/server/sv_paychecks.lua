QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('crfw-paychecks:Register')
AddEventHandler('crfw-paychecks:Register', function()
    local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)	
	local cid = xPlayer.PlayerData.citizenid
    local payment = xPlayer.PlayerData.job.payment
    if xPlayer.PlayerData.job.onduty then
        exports.oxmysql:fetch("SELECT * FROM `paychecks` WHERE citizenid = '"..cid.."'", function(result)
            if result[1] ~= nil then
                local collectamount = result[1].collectamount+payment
                local currentpaycheck = result[1].collectamount
                exports.oxmysql:execute("UPDATE paychecks SET collectamount = '"..collectamount.."' WHERE citizenid = '"..cid.."'")
                TriggerClientEvent('QBCore:Notify', source, 'Your paycheck has been sent to Big Bank, Go there to collect it.')
                Citizen.Wait(1000)
                TriggerEvent('qb-logs:server:createLog', 'paychecks', 'Paychecks', " | "..cid.." now has "..collectamount.." waiting as a paycheck", false, source)
            else	
                exports.oxmysql:insert("INSERT INTO `paychecks` (`citizenid`, `collectamount`) VALUES ('"..cid.."', '"..payment.."')")
            end
        end)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You aren\'t on duty so you did not receive a paycheck.')
    end
end)

RegisterServerEvent('crfw-paychecks:Collect')
AddEventHandler('crfw-paychecks:Collect', function()
    local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)	
	local cid = xPlayer.PlayerData.citizenid
    local payment = xPlayer.PlayerData.job.payment
    exports.oxmysql:fetch("SELECT * FROM `paychecks` WHERE citizenid = '"..cid.."'", function(result)
        if result[1] ~= nil then
            local paycheck = result[1].collectamount
            xPlayer.Functions.AddMoney("cash", paycheck)
            exports.oxmysql:execute("UPDATE paychecks SET collectamount = 0 WHERE citizenid = '"..cid.."'")
            TriggerClientEvent('QBCore:Notify', source, 'You received your paycheck of '..paycheck..'!')
            TriggerEvent('qb-logs:server:createLog', 'paychecks', 'Paychecks', " | "..cid.." collected "..paycheck.." from their paycheck", false, source)
        else
        end
    end)
end)


RegisterNetEvent("qb-vape:server:effects", function(entity, coords)
	for _, player in pairs(QBCore.Functions.GetPlayers()) do
		TriggerClientEvent("qb-vape:client:effects", player, entity, coords)
    end
end)

QBCore.Functions.CreateUseableItem("vape", function(source, item)
    TriggerClientEvent("qb-vape:client:use", source)
end)
