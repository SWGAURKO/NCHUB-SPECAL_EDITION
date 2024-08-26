
local playAnim = false
local phoneProp = 0
local phoneModel = Config.PhoneModel
local cooldown = false

-- Item checks to return whether or not the client has a phone or not
local function HasPhone()
    return QBCore.Functions.HasItem("phone")
end

RegisterCommand('rozenhola', function()
    SetLocalPlayerAsGhost(false)
    SetNetworkVehicleAsGhost(GetVehiclePedIsIn(PlayerPedId(), true), false)
end)

-- Loads the animdict so we can execute it on the ped
local function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(1000)
    end
end

local function DeletePhone()
	if phoneProp ~= 0 then
		DeleteObject(phoneProp)
		phoneProp = 0
	end
end

local function NewPropWhoDis()
	DeletePhone()
	RequestModel(phoneModel)
	while not HasModelLoaded(phoneModel) do
		Wait(500)
	end
	phoneProp = CreateObject(phoneModel, 1.0, 1.0, 1.0, 1, 1, 0)

	local bone = GetPedBoneIndex(PlayerPedId(), 28422)
	if phoneModel == Config.PhoneModel then
		AttachEntityToEntity(phoneProp, PlayerPedId(), bone, 0.0, 0.0, 0.0, 15.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
	else
		AttachEntityToEntity(phoneProp, PlayerPedId(), bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
	end
    SetModelAsNoLongerNeeded(phoneModel)
end

-- Does the actual animation of the animation when calling 911
local function PhoneCallAnim()
    loadAnimDict("cellphone@")
    local ped = PlayerPedId()
    CreateThread(function()
        NewPropWhoDis()
        playAnim = true
        while playAnim do
            if not IsEntityPlayingAnim(ped, "cellphone@", 'cellphone_text_to_call', 3) then
                TaskPlayAnim(ped, "cellphone@", 'cellphone_text_to_call', 3.0, 3.0, -1, 50, 0, false, false, false)
            end
            Wait(100)
        end
    end)
end
