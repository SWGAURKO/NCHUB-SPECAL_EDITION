

local handsup = false
RegisterCommand("+handsup", function()
		local playerPed = PlayerPedId()
		RequestAnimDict('missminuteman_1ig_2')
		while not HasAnimDictLoaded('missminuteman_1ig_2') do
			Wait(100)
		end
		if handsUp then
			handsUp = false
			ClearPedSecondaryTask(playerPed)
		else
		handsUp = true
		TaskPlayAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
    end
end)

RegisterKeyMapping('+handsup', '(Player) Hands Up', 'keyboard', 'x')

local crouched = false

RegisterCommand("+crouch", function()
    local ped = PlayerPedId()
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        if (not IsPauseMenuActive()) then 
                RequestAnimSet("move_ped_crouched")
                while (not HasAnimSetLoaded("move_ped_crouched")) do 
                    Citizen.Wait(1000)
                end 		
                if (crouched) then 
                    ResetPedMovementClipset(ped)
                    ResetPedStrafeClipset(ped)
                    crouched = false 
                    TriggerEvent("dpemotes:WalkCommandStart")
                elseif (not crouched) then
                    SetPedMovementClipset(ped, "move_ped_crouched", 0.65)
                    SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
                    crouched = true 
                end 
            end
        else
        crouched = false
    end
end)

RegisterKeyMapping('+crouch', '(Player) Toggle Crouch', 'keyboard', 'left ctrl')