SavedRadio = {}

local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("radio", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("radioGui", source)
	end
end)

RegisterServerEvent("QBCore:Player:OnRemovedItem")
AddEventHandler("QBCore:Player:OnRemovedItem", function(source, item)
    if item.name == 'radio' and GetItem(source, item.name).count < 1 then
      TriggerClientEvent("remove:radio", source)
    end
end)

function GetItem(source, item)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local count = 0

	for k,v in pairs(xPlayer['PlayerData']['items']) do
		if v.name == item then
			count = count + v.amount
		end
	end
	
	return { name = item, count = count }
end