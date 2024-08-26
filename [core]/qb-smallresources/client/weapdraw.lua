-- Variables
local QBCore = exports['qb-core']:GetCoreObject()

local weapons = {
    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_BREAD',
    'WEAPON_FLASHLIGHT',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_REVOLVER_MK2',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MINISMG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_COMBATPDW',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_GUSENBERG',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_DIGISCANNER',
    'WEAPON_FIREWORK',
    'WEAPON_MUSKET',
    'WEAPON_STUNGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_PROXMINE',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_RAILGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_PIPEBOMB',
    'WEAPON_DOUBLEACTION',
    'WEAPON_M4',
    'WEAPON_MICROSMG2',
    'WEAPON_MICROSMG3',
    'WEAPON_GLOCK',
    'WEAPON_STUNGUN',
	'WEAPON_TASER',
    'WEAPON_KATANA',
    'WEAPON_SNIPERRIFLE2',
	-- 'WEAPON_PLASMAP',
    'WEAPON_SLEDGEHAM',
    'WEAPON_STAFF',
    'WEAPON_BROWNING',
    'WEAPON_DP9',
    'WEAPON_ASSAULTRIFLE2',
	'WEAPON_MEGAPHONE',
    'WEAPON_LTL',
    'WEAPON_SNSPISTOL_MK2',
	'WEAPON_GEPARD',
    'WEAPON_KATANA',
    'WEAPON_SLEDGEHAM',
	'WEAPON_SPECIALCARBINE_MK2',
	'WEAPON_MINISMG2',
	'WEAPON_MP7',
	'WEAPON_BATS',
	'WEAPON_STONE_HATCHET',
	'WEAPON_VECTOR',
	'WEAPON_COMBATSHOTGUN',
	'WEAPON_MACHINEPISTOL',
	'WEAPON_KARAMBIT',
}

-- Wheapons that require the Police holster animation
local holsterableWeapons = {
	--'WEAPON_STUNGUN',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_GLOCK',
	'WEAPON_M4',
	'WEAPON_TASER',
	'WEAPON_MP7',
	'WEAPON_SMG',
	'WEAPON_PUMPSHOTGUN_MK2',
}

local JobName = 'unemployed'
local holstered = true
local canFire = true
local currWeapon = `WEAPON_UNARMED`

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function CheckWeapon(newWeap)
	for i = 1, #weapons do
		if joaat(weapons[i]) == newWeap then
			return true
		end
	end
	return false
end

local function IsWeaponHolsterable(weap)
	for i = 1, #holsterableWeapons do
		if joaat(holsterableWeapons[i]) == weap then
			return true
		end
	end
	return false
end

RegisterNetEvent('weapons:ResetHolster', function()
	holstered = true
	canFire = true
	currWeapon = `WEAPON_UNARMED`
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    JobName = player.job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    JobName = JobInfo.name
end)


CreateThread(function()
	if QBCore.Functions.GetPlayerData().job then
		JobName = QBCore.Functions.GetPlayerData().job.name
	end
end)


CreateThread(function()
	if GetResourceState('qb-inventory') == 'missing' then return end -- This part is only made to work with qb-inventory, other inventories might conflict
	local sleep
	while true do
		local ped = PlayerPedId()
		sleep = 250
		if DoesEntityExist(ped) and currWeapon ~= GetSelectedPedWeapon(ped) and not IsEntityDead(ped) and not IsPedInParachuteFreeFall(ped) and not IsPedFalling(ped) and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) then
			sleep = 0
			local pos = GetEntityCoords(ped, true)
			local rot = GetEntityHeading(ped)

			local newWeap = GetSelectedPedWeapon(ped)
			SetCurrentPedWeapon(ped, currWeapon, true)
			loadAnimDict("reaction@intimidation@1h")
			loadAnimDict("reaction@intimidation@cop@unarmed")
			loadAnimDict("rcmjosh4")
			loadAnimDict("weapons@pistol@")


			if CheckWeapon(newWeap) then
				if holstered then
					if JobName == 'police' or JobName == 'corretions' then
						--TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
						canFire = false
						TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
						Wait(300)
						SetCurrentPedWeapon(ped, newWeap, true)

						currWeapon = newWeap
						Wait(300)
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					else
						canFire = false
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
						Wait(1000)
						SetCurrentPedWeapon(ped, newWeap, true)
						currWeapon = newWeap
						Wait(1400)
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					end
				elseif newWeap ~= currWeapon and CheckWeapon(currWeapon) then
					if JobName == 'police' or JobName == 'corretions' then
						canFire = false

						TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
						Wait(500)

						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

						TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
						Wait(300)
						SetCurrentPedWeapon(ped, newWeap, true)

						Wait(500)
						currWeapon = newWeap
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					else
						canFire = false
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
						Wait(1600)
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
						Wait(1000)
						SetCurrentPedWeapon(ped, newWeap, true)
						currWeapon = newWeap
						Wait(1400)
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					end
				else
					if JobName == 'police' or JobName == 'corretions' then
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
						Wait(300)
						SetCurrentPedWeapon(ped, newWeap, true)


						currWeapon = newWeap
						Wait(300)
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					else
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
						Wait(1000)
						SetCurrentPedWeapon(ped, newWeap, true)
						currWeapon = newWeap
						Wait(1400)
						ClearPedTasks(ped)
						holstered = false
						canFire = true
					end
				end
			else
				if not holstered and CheckWeapon(currWeapon) then
					if JobName == 'police' or JobName == 'corretions' then
						canFire = false
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
						Wait(500)


						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						ClearPedTasks(ped)
						SetCurrentPedWeapon(ped, newWeap, true)
						holstered = true
						canFire = true
						currWeapon = newWeap
					else
						canFire = false
						TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
						Wait(1400)
						SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
						ClearPedTasks(ped)
						SetCurrentPedWeapon(ped, newWeap, true)
						holstered = true
						canFire = true
						currWeapon = newWeap
					end
				else
					SetCurrentPedWeapon(ped, newWeap, true)
					holstered = false
					canFire = true
					currWeapon = newWeap
				end
			end
		end

		Wait(sleep)
	end
end)

CreateThread(function()
	local sleep
	while true do
		sleep = 250
		if not canFire then
			sleep = 0
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(PlayerId(), true)
		end
		Wait(sleep)
	end
end)
