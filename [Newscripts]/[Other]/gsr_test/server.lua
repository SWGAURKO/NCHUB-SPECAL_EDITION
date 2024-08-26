RegisterNetEvent("gsr:doTest")
AddEventHandler("gsr:doTest", function(target)
	local src = source
	TriggerClientEvent('gsr:requestGSR', target, src)	
end)

RegisterNetEvent("gsr:returnGSR")
AddEventHandler("gsr:returnGSR", function(shotRecently, policeId)
	local src = source
	local result = 'Negative [❌]'
	if shotRecently then result = 'Positive [✔️]';
	TriggerClientEvent('QBCore:Notify', policeId, "The results of the GSR test arrived: "..result, "success")
	else
	TriggerClientEvent('QBCore:Notify', policeId, "The results of the GSR test arrived: "..result, "error")
	end
end)