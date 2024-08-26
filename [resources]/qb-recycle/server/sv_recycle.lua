QBCore = exports['qb-core']:GetCoreObject()


Config.SmallRewardMin = "25"
Config.SmallRewardMax = "27"

Config.SmallMedMinReward = "28"
Config.SmallMedMaxReward = "30"

Config.MedMinReward = "30"
Config.MedMaxReward = "35"

Config.BigRewardMin = "40"
Config.BigRewardMax = "45"

local ItemTable = {
    "plastic",
    "metalscrap",
    "copper",
    "aluminum",
    "iron",
    "steel",
    "glass",
    "rubber",
}

-- Materials Reward Event
RegisterNetEvent("qb-recycle:getrecyclablematerial", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = math.random(5, 15)
    Player.Functions.AddItem("recyclablematerial", amount, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'add', amount)
    Citizen.Wait(500)
end)

-- Trade Event
RegisterServerEvent("qb-recycle:TradeItems")
AddEventHandler("qb-recycle:TradeItems", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randItem = ""
	local amount = 0
	if data == 1 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 10 then
			Player.Functions.RemoveItem("recyclablematerial", 10)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 10)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallRewardMin, Config.SmallRewardMax)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallRewardMin, Config.SmallRewardMax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallRewardMin, Config.SmallRewardMax)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			else
				TriggerClientEvent('QBCore:Notify', src, "Not enough materials")
			end
	elseif data == 2 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 25 then
			Player.Functions.RemoveItem("recyclablematerial", 25)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 25)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallMedMinReward, Config.SmallMedMaxReward)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallMedMinReward, Config.SmallMedMaxReward)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.SmallMedMinReward, Config.SmallMedMaxReward)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			else
				TriggerClientEvent('QBCore:Notify', src, "Not enough materials")
			end
	elseif data == 3 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 50 then
			Player.Functions.RemoveItem("recyclablematerial", 50)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 50)
			Citizen.Wait(1000)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.MedMinReward, Config.MedMaxReward)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.MedMinReward, Config.MedMaxReward)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.MedMinReward, Config.MedMaxReward)
			Citizen.Wait(1000)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			else
				TriggerClientEvent('QBCore:Notify', src, "Not enough materials")
			end
	elseif data == 4 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 100 then
			Player.Functions.RemoveItem("recyclablematerial", 100)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 100)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.BigRewardMin, Config.BigRewardMax)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000) 

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.BigRewardMin, Config.BigRewardMax)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)

			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.BigRewardMin, Config.BigRewardMax)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
			
			randItem = ItemTable[math.random(1, #ItemTable)]
			amount = math.random(Config.BigRewardMin, Config.BigRewardMax)
			Player.Functions.AddItem(randItem, amount, false)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			Citizen.Wait(1000)
		else
			TriggerClientEvent('QBCore:Notify', src, "Not enough materials.")
		end
    end
end)


QBCore.Commands.Add('sellvehicle', 'Transfer Vehicle', {{name = 'id', help = 'Player ID'}}, true, function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    local ped = GetPlayerPed(src)
    local target = GetPlayerPed(targetId)
    local sendingPlayer = QBCore.Functions.GetPlayer(src)
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    local vehicle = GetVehiclePedIsIn(ped, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    if targetId ~= nil then
        if vehicle ~= 0 then
            if target ~= 0 then
                local pedCoords = GetEntityCoords(ped)
                local targetCoords = GetEntityCoords(target)
                if #(pedCoords - targetCoords) < 5 then
                    local result = exports.oxmysql:scalarSync('SELECT citizenid from player_vehicles WHERE plate = ?', {plate})
                    if result == sendingPlayer.PlayerData.citizenid then
                        exports.oxmysql:execute('UPDATE player_vehicles SET citizenid = ? WHERE plate =?', {targetPlayer.PlayerData.citizenid, plate})
                        TriggerClientEvent('QBCore:Notify', src, 'You Transferred Vehicle With Plate ' ..plate, 'success')
                        TriggerClientEvent('QBCore:Notify', targetId, 'You Received Vehicle With Plate ' ..plate, 'success')
                    else
                        TriggerClientEvent('QBCore:Notify', src, 'You Don\'t Own This Vehicle', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Player Too Far Away', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You Are Not In A Vehicle', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Must Specify ID', 'error')
    end
end, 'user')
