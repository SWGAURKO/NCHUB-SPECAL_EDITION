-- Variables
local QBCORE = exports["qb-core"]:GetCoreObject()

local PED_CONFIG = {
    MODEL = "csb_djblamadon",
    COORDS = vector4(vector4(-69.57727, 88.06031, 70.568878, 155.66635)),
}

local PRICE_OFF = 10

-- Functions
local function openMenu()
    exports["qb-menu"]:openMenu({
        {
            header = "Are you sure you wanna sell your car?",
            txt = "Even god can't revert this action.. 😱",
            isMenuHeader = true
        },
        {
            header = "Whatever lemme sell this car",
            txt = string.format("You will get %d%% of the actual car's price", PRICE_OFF),
            params = {
                event = "orangutan:sellvehicle:confirm",
            }
        },
        { 
            header = "Nah I want to keep my car",
            txt = "",
            params = {
                event = "",
            }
        },
    })
end


local function spawnModel()
    RequestModel(joaat(PED_CONFIG.MODEL))
    while not HasModelLoaded(joaat(PED_CONFIG.MODEL)) do
        Wait(100)
    end

    local ped = CreatePed(4, joaat(PED_CONFIG.MODEL), PED_CONFIG.COORDS, 0.0, false, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, PED_CONFIG.COORDS.w)

    exports["qb-target"]:AddTargetEntity(ped, {
        options = {
            {
                event = "orangutan:sellvehicle:menu",
                icon = "fa-solid fa-face-angry",
                label = string.format("Sell your car (%d%%)", PRICE_OFF),
                canInteract = function()
                    return IsPedInAnyVehicle(PlayerPedId(), false)
                end
            }
        },
        distance = 10
    })
end


local function confirmAction()
    local playerPed = PlayerPedId()

    if not DoesEntityExist(playerPed) then return end

    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not DoesEntityExist(vehicle) then return end

    local plate = GetVehicleNumberPlateText(vehicle)
    local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

    TriggerServerEvent("orangutan:sellvehicle:sell", plate, string.lower(vehicleName), vehicle)
end


local function deleteVehicle()
    local playerPed = PlayerPedId()

    if not DoesEntityExist(playerPed) then return end

    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not DoesEntityExist(vehicle) then return end

    QBCORE.Functions.DeleteVehicle(vehicle)
end

-- Events
RegisterNetEvent("orangutan:sellvehicle:menu", openMenu)
RegisterNetEvent("orangutan:sellvehicle:confirm", confirmAction)
RegisterNetEvent("orangutan:sellvehicle:deletevehicle", deleteVehicle)

-- Threads
CreateThread(spawnModel)