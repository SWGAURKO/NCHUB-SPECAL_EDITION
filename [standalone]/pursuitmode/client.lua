local QBCore = exports['qb-core']:GetCoreObject() 
local currentClass = "A"
local currentMode = "Automatic"
local vaildveh = false
local inVehicle = false

-- Pursuit Mode

function validVehicle(vehicleModel)
    for k,v in pairs(Config.VehiclesConfig) do
        if Config.VehiclesConfig[k]["model"] == vehicleModel then
            return true
        end
    end

    return false
end


function getHandlingConfig(vehicleModel, type)
    for k,v in pairs(Config.VehiclesConfig) do
        if Config.VehiclesConfig[k]["model"] == vehicleModel then
            return Config.VehiclesConfig[k][currentClass][type]
        end
    end
end

function changeClass()
    if currentClass == "A" then
        currentClass = "A+"
    elseif currentClass == "A+" then
        currentClass = "S+"
        SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId()), 0)
        ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 22, true) -- toggle xenon lights
        ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 18, true) -- upgrade turbo to max level
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 11, 3, false) -- upgrade engine to max level
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 13, 2, false) -- upgrade engine to max level
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 12, 2, false) 
        SetVehicleXenonLightsColor(GetVehiclePedIsIn(PlayerPedId()), 1) -- change xenon lights color
    elseif currentClass == "S+" then
        currentClass = "A"
        ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 22, false) -- toggle off xenon lights
        ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 18, false) -- toggle off turbo
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 13, -1, false)
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 12, -1, false) 
        SetVehicleMod(GetVehiclePedIsIn(PlayerPedId()), 11, -1, false) -- change engine to lowest level
    end
end


RegisterCommand('pursuit', function()
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, true) then
        local plyVehicle = GetVehiclePedIsIn(ped)
        if validVehicle(GetEntityModel(plyVehicle)) and DoesEntityExist(plyVehicle) then
            vaildveh = true
            changeClass()
            QBCore.Functions.Notify("Changed class to " .. currentClass)
            SetVehicleHandlingFloat(plyVehicle, "CHandlingData", "fDriveInertia", getHandlingConfig(GetEntityModel(plyVehicle), "fDriveInertia"))
            SetVehicleHandlingFloat(plyVehicle, "CHandlingData", "fInitialDriveMaxFlatVel", getHandlingConfig(GetEntityModel(plyVehicle), "fInitialDriveMaxFlatVel"))
            SetVehicleHandlingFloat(plyVehicle, "CHandlingData", "fBrakeForce", getHandlingConfig(GetEntityModel(plyVehicle), "fBrakeForce"))
            SetVehicleHandlingFloat(plyVehicle, "CHandlingData", "fSteeringLock", getHandlingConfig(GetEntityModel(plyVehicle), "fSteeringLock"))
            SetVehicleHandlingFloat(plyVehicle, "CHandlingData", "fInitialDriveForce", getHandlingConfig(GetEntityModel(plyVehicle), "fInitialDriveForce"))
        end
    end

end)

CreateThread(function()
    RegisterKeyMapping("pursuit", "Pursuit", "keyboard", "UP")
end)

-- RegisterCommand('weaponmode', function()
--     if currentMode == "Automatic" then
--                 currentMode = "Single"
--                 QBCore.Functions.Notify("Changed weapon mode to Single")
--             elseif currentMode == "Single" then
--                 currentMode = "Automatic"
--                 QBCore.Functions.Notify("Changed weapon mode to Automatic")
--     end
-- end)


-- CreateThread(function()
--     RegisterKeyMapping("weaponmode", "Change Weapon Mode", "keyboard", "N")
-- end)

exports("currentClass", function()
    local plyVehicle = GetVehiclePedIsIn(PlayerPedId())
    if validVehicle(GetEntityModel(plyVehicle)) and DoesEntityExist(plyVehicle) then
    if currentClass == nil then
        return 0
    elseif currentClass == "A" then
        return 25
    elseif currentClass == "A+" then
        return 60
    elseif currentClass == "S+" then
        return 100
    end
end
end)

exports("validVehicle", function()
    return vaildveh
end)

-- Weapon Modes

exports("currentMode", function()
    if currentMode == "Single" then
        return 25
    elseif currentMode == "Automatic" then
        return 100
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local shooting = IsPedShooting(playerPed)

        if shooting and currentMode == "Single" then
            DisablePlayerFiring(playerPed, true)
        end

    end
end)