Citizen.CreateThread(function()
	if IsWeaponValid(`WEAPON_SMOK2GRENADE`) then
		AddTextEntry("WT_GNADE_SMKK", Config.WeaponLabel)
	end

	while true do
		local playerPed = PlayerPedId()
		local weapon = GetSelectedPedWeapon(playerPed)
		if weapon == `WEAPON_SMOK2GRENADE` then
			if IsPedShooting(playerPed) then
				local playerCoords = GetEntityCoords(playerPed)
				Citizen.CreateThread(function()
					local handle = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 50.0, `w_ex_smokegrenade_2`, false, false, false)
					Citizen.Wait(Config.ExplodeTime)
					if DoesEntityExist(handle) then
						local grenadeCoords = GetEntityCoords(handle)
						SetEntityAsMissionEntity(handle, false, true)
						DeleteEntity(handle)
						TriggerServerEvent("mmsmokegrenade:explode", grenadeCoords)
					end
				end)
			end
		else
			Citizen.Wait(300)
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent("mmsmokegrenade:explode", function(coords)
	local playerCoords = GetEntityCoords(PlayerPedId())

	if #(playerCoords - coords) < Config.SmokeVisibilityDistance then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(0)
		end
		UseParticleFxAssetNextCall("core")
		
		local particle = StartParticleFxLoopedAtCoord("exp_grd_grenade_smoke", coords.x, coords.y, coords.z + 0.2, 0.0, 0.0, 0.0, Config.SmokeSize, false, false, false, false)
		local particle2 = StartParticleFxLoopedAtCoord("weap_smoke_grenade", coords.x, coords.y, coords.z - 0.4, 0.0, 0.0, 0.0, Config.SmokeSize, false, false, false, false)

		Citizen.Wait(Config.SmokeTime)

		StopParticleFxLooped(particle, 0)
		StopParticleFxLooped(particle2, 0)
	end
end)

RegisterCommand("smoke", function()
	GiveWeaponToPed(PlayerPedId(), `WEAPON_SMOK2GRENADE`, 10, false, true)
end, false)