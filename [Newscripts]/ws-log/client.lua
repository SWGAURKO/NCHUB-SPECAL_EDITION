CreateThread(function()
	local dead = false
	while true do
		local ped = PlayerPedId()
		if IsEntityDead(ped) then
			if not dead then 
				local killer = GetPedSourceOfDeath(ped)
				local killerid = -1
				local killerType = GetEntityType(killer)
				if killerType == 1 then
					killerid = GetPlayerServerId(NetworkGetEntityOwner(killer))
					
				elseif killerType == 2 then
					local ped = GetPedInVehicleSeat(killer, -1)
					if ped ~= 0 and IsPedAPlayer(ped) then
						killer = ped
						killerid = GetPlayerServerId(NetworkGetEntityOwner(killer))
						
					end
				end
				if killerid ~= -1 and IsPedAPlayer(killer) then
					TriggerServerEvent("ws-log:killed", killerid)
				else
					TriggerServerEvent("ws-log:died")
				end
				dead = true
			end
		elseif dead then
			dead = false
		end
		Wait(500)
	end
end)
