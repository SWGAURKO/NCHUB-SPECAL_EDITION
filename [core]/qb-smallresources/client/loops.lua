local disabledPickups = {
    `PICKUP_WEAPON_ADVANCEDRIFLE`,
    `PICKUP_WEAPON_APPISTOL`,
    `PICKUP_WEAPON_ASSAULTRIFLE`,
    `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
    `PICKUP_WEAPON_ASSAULTSHOTGUN`,
    `PICKUP_WEAPON_ASSAULTSMG`,
    `PICKUP_WEAPON_AUTOSHOTGUN`,
    `PICKUP_WEAPON_BAT`,
    `PICKUP_WEAPON_BATTLEAXE`,
    `PICKUP_WEAPON_BOTTLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
    `PICKUP_WEAPON_BULLPUPSHOTGUN`,
    `PICKUP_WEAPON_CARBINERIFLE`,
    `PICKUP_WEAPON_CARBINERIFLE_MK2`,
    `PICKUP_WEAPON_COMBATMG`,
    `PICKUP_WEAPON_COMBATMG_MK2`,
    `PICKUP_WEAPON_COMBATPDW`,
    `PICKUP_WEAPON_COMBATPISTOL`,
    `PICKUP_WEAPON_COMPACTLAUNCHER`,
    `PICKUP_WEAPON_COMPACTRIFLE`,
    `PICKUP_WEAPON_CROWBAR`,
    `PICKUP_WEAPON_DAGGER`,
    `PICKUP_WEAPON_DBSHOTGUN`,
    `PICKUP_WEAPON_DOUBLEACTION`,
    `PICKUP_WEAPON_FIREWORK`,
    `PICKUP_WEAPON_FLAREGUN`,
    `PICKUP_WEAPON_FLASHLIGHT`,
    `PICKUP_WEAPON_GRENADE`,
    `PICKUP_WEAPON_GRENADELAUNCHER`,
    `PICKUP_WEAPON_GUSENBERG`,
    `PICKUP_WEAPON_GolfClub`,
    `PICKUP_WEAPON_HAMMER`,
    `PICKUP_WEAPON_HATCHET`,
    `PICKUP_WEAPON_HEAVYPISTOL`,
    `PICKUP_WEAPON_HEAVYSHOTGUN`,
    `PICKUP_WEAPON_HEAVYSNIPER`,
    `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
    `PICKUP_WEAPON_HOMINGLAUNCHER`,
    `PICKUP_WEAPON_KNIFE`,
    `PICKUP_WEAPON_KNUCKLE`,
    `PICKUP_WEAPON_MACHETE`,
    `PICKUP_WEAPON_MACHINEPISTOL`,
    `PICKUP_WEAPON_MARKSMANPISTOL`,
    `PICKUP_WEAPON_MARKSMANRIFLE`,
    `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
    `PICKUP_WEAPON_MG`,
    `PICKUP_WEAPON_MICROSMG`,
    `PICKUP_WEAPON_MINIGUN`,
    `PICKUP_WEAPON_MINISMG`,
    `PICKUP_WEAPON_MOLOTOV`,
    `PICKUP_WEAPON_MUSKET`,
    `PICKUP_WEAPON_NIGHTSTICK`,
    `PICKUP_WEAPON_PETROLCAN`,
    `PICKUP_WEAPON_PIPEBOMB`,
    `PICKUP_WEAPON_PISTOL`,
    `PICKUP_WEAPON_PISTOL50`,
    `PICKUP_WEAPON_PISTOL_MK2`,
    `PICKUP_WEAPON_POOLCUE`,
    `PICKUP_WEAPON_PROXMINE`,
    `PICKUP_WEAPON_PUMPSHOTGUN`,
    `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
    `PICKUP_WEAPON_RAILGUN`,
    `PICKUP_WEAPON_RAYCARBINE`,
    `PICKUP_WEAPON_RAYMINIGUN`,
    `PICKUP_WEAPON_RAYPISTOL`,
    `PICKUP_WEAPON_REVOLVER`,
    `PICKUP_WEAPON_REVOLVER_MK2`,
    `PICKUP_WEAPON_RPG`,
    `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
    `PICKUP_WEAPON_SMG`,
    `PICKUP_WEAPON_SMG_MK2`,
    `PICKUP_WEAPON_SMOKEGRENADE`,
    `PICKUP_WEAPON_SNIPERRIFLE`,
    `PICKUP_WEAPON_SNSPISTOL`,
    `PICKUP_WEAPON_SNSPISTOL_MK2`,
    `PICKUP_WEAPON_SPECIALCARBINE`,
    `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
    `PICKUP_WEAPON_STICKYBOMB`,
    `PICKUP_WEAPON_STONE_HATCHET`,
    `PICKUP_WEAPON_STUNGUN`,
    `PICKUP_WEAPON_SWITCHBLADE`,
    `PICKUP_WEAPON_VINTAGEPISTOL`,
    `PICKUP_WEAPON_WRENCH`
}

CreateThread(function()
  local pedPool = GetGamePool('CPed')
  for k,v in pairs(pedPool) do
      SetPedDropsWeaponsWhenDead(v, false)
  end
end)

AddEventHandler("populationPedCreating", function(x, y, z, model)
	Wait(500)	-- Give the entity some time to be created
	local found, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

AddEventHandler("playerSpawned", function()
  NetworkSetFriendlyFireOption(true)
	SetPoliceIgnorePlayer(PlayerId(), true)
	SetDispatchCopsForPlayer(PlayerId(), false)
	SetPlayerWantedLevel(PlayerId(), 0, false)
	SetMaxWantedLevel(0)
  SetCanAttackFriendly(PlayerPedId(), true, true)
	DisablePlayerVehicleRewards(PlayerId()) 
  SetRelationshipBetweenGroups(1, `COP`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `MEDIC`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `FIREMAN`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `GANG_1`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `GANG_2`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `GANG_9`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `GANG_10`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_CULT`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `PLAYER`)
  SetRelationshipBetweenGroups(1, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
end)



function Components()
	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(14)
	HideHudComponentThisFrame(17)
	HideHudComponentThisFrame(19)
	HideHudComponentThisFrame(20)
	HideHudComponentThisFrame(21)
	HideHudComponentThisFrame(22)
	HudWeaponWheelIgnoreSelection()  -- CAN'T SELECT GetSelectedPedWeapon(PlayerPedId()) FROM SCROLL WHEEL
	DisableControlAction(0, 37, true)
	DisplayAmmoThisFrame(true)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(150)
		if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(PlayerPedId(), 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end
		end

		if not IsPedArmed(PlayerPedId(), 6) then
		  DisableControlAction(0, 36) -- LCTRL
		end
		
    if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) and not IsEntityDead(GetVehiclePedIsIn(PlayerPedId(), false)) then
        -- If it's not a boat, plane or helicopter, and the vehicle is off the ground with ALL wheels, then block steering/leaning left/right/up/down.
			if not IsThisModelABicycle(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and not IsThisModelABoat(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and not IsThisModelAHeli(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and not IsThisModelAPlane(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))) and IsEntityInAir(GetVehiclePedIsIn(PlayerPedId(), false)) then
            DisableControlAction(0, 59) -- leaning left/right
            DisableControlAction(0, 60) -- leaning up/down
        end
		end
		
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId(), 165) then
					SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
				end
			end
		end

    Components()
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)

		if DoesEntityExist(PlayerPedId()) and IsPedInAnyVehicle(PlayerPedId(), false) and IsControlPressed(2, 75) and not IsEntityDead(PlayerPedId()) and not IsPauseMenuActive() then
			if GetIsVehicleEngineRunning(GetVehiclePedIsIn(PlayerPedId(), false)) then
				SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false), true, true, true)
			end
		end

		SetPedConfigFlag(PlayerPedId(), 35, false)
		
		if IsPedInCover(PlayerPedId(), 0) and not IsPedAimingFromCover(PlayerPedId()) then
        DisablePlayerFiring(PlayerPedId(), true)
    end

		if IsPedBeingStunned(PlayerPedId()) then
			SetPedMinGroundTimeForStungun(PlayerPedId(), 6000)
		end
	end
	Citizen.Wait(500)
end)

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1000)
	  if not IsPedInAnyVehicle(PlayerPedId(), false) then
		if IsPedUsingActionMode(PlayerPedId()) then
		  SetPedUsingActionMode(PlayerPedId(), -1, -1, 1)
		end
	  else
		Citizen.Wait(3000)
	  end
	end
end)


RegisterCommand('propfix', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
            TriggerEvent("ur-backitems:refresh")
        end
    end
    Wait(650)
end)



local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

-- RegisterCommand("shuff", function(source, args, raw) --change command here
--     TriggerEvent("SeatShuffle")
-- end, false) --False, allow everyone to run it




CreateThread(function() -- all these should only need to be called once
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
	ClearAreaOfPeds(1735.7493, 2522.2502, 45.552814, 217.56741, 10, 1)
	ClearAreaOfPeds(106.11752, -1290.843, 29.249711, 288.82092, 20, 1)
  ClearAreaOfPeds(267.36361, -614.2355, 42.527362, 334.91632, 20, 1)
end)






Citizen.CreateThread( function()
	
	local resetcounter = 0
	local jumpDisabled = true
  	while true do 
    Citizen.Wait(1)
		if jumpDisabled and resetcounter > 0 and IsPedJumping(PlayerPedId()) then	
			SetPedToRagdoll(PlayerPedId(), 1000, 1000, 3, 0, 0, 0)
			resetcounter = 0
		end
		if not jumpDisabled and IsPedJumping(PlayerPedId()) then
			if math.random(2) == 2 then
				jumpDisabled = true
			end
			resetcounter = 1000
			Citizen.Wait(1200)
		end
		if resetcounter > 0 then
			resetcounter = resetcounter - 1
		else
			if jumpDisabled then
				resetcounter = 0
				jumpDisabled = false
			end
		end
	end
end) 