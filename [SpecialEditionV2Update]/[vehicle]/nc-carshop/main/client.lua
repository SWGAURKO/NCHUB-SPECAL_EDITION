isOpen, TestDriveTime, SpawnCoords, Coords, TestDrive, lastPlayerCoords, Framework, CameraCoords = {}, true, nil, nil, nil, nil, nil, nil, nil, nil
Framework = GetFramework()
Citizen.CreateThread(function()
   while Framework == nil do Citizen.Wait(750) end
   Citizen.Wait(2500)
end)
Callback = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.TriggerServerCallback or Framework.Functions.TriggerCallback
Properties = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.Game.GetVehicleProperties or Framework.Functions.GetVehicleProperties


function CreateAndSetupVehicle(data, coords, Plate)
    local hash = GetHashKey(data.model)
    RequestModel(hash)

    while not HasModelLoaded(hash) do 
        Citizen.Wait(10) 
    end

    local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.w, true, false)
    local netid = NetworkGetNetworkIdFromEntity(vehicle)

    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetVehicleNumberPlateText(vehicle, Plate)
    SetVehicleCustomPrimaryColour(vehicle, data.color.R, data.color.G, data.color.B)
    SetVehicleCustomSecondaryColour(vehicle, data.color.R, data.color.G, data.color.B)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, 'OFF')

    return vehicle
end

RegisterNUICallback("Buy", function(data, cb)
    Callback("isPrice", function(result)
        if not result then
            print('Insufficient Money')
            return
        end

        local coords = konumfor(SpawnCoords)
        if not coords then return end

        local Plate = data.plate and data.plate ~= old and data.plate or CustomizePlate()
        old = Plate
        Plate = Trim(Plate)

        local buycar = CreateAndSetupVehicle(data, coords, Plate)

        CloseNui()
        CustomizeCamera(isOpen)
        Config.Carkeys(Plate)
        SendNUIMessage({action = "CLOSE"})

        print(Plate, Properties(buycar), data.model)
        TriggerServerEvent("vehicleshop:setVehicleOwned", Plate, Properties(buycar), data.model)
    end, data.price, data.payment)
end)


RegisterNUICallback("TestDrive", function(data, cb)
    SetEntityVisible(PlayerPedId(), true)
    local hash = GetHashKey(data.car)
    local playerPed = PlayerPedId()

    lastPlayerCoords = GetEntityCoords(playerPed)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(10) end

    local testDriveEntity = CreateVehicle(hash, vector4(TestDrive), true, true)
    local Plate = "TestCar"
    
    SetPedIntoVehicle(playerPed, testDriveEntity, -1)
    SetVehicleNumberPlateText(testDriveEntity, Plate)
    SetVehicleCustomPrimaryColour(testDriveEntity, data.color.R, data.color.G, data.color.B)
    SetVehicleCustomSecondaryColour(testDriveEntity, data.color.R, data.color.G, data.color.B)
    Config.Carkeys(Plate)

    startCountDown = true
    local timeGG = GetGameTimer()

    Citizen.CreateThread(function()
        while startCountDown do
            SendNUIMessage({action = "CLOSE"})
            Citizen.Wait(1)
            local timer = GetGameTimer()
            if timer < timeGG + tonumber(1000*TestDriveTime) then
                drawTxt(' ~r~ TEST DRIVE:' .. math.ceil(TestDriveTime - (timer - timeGG)/1000) ,4,0.5,0.93,0.50,255,255,255,180)
            else
                DeleteEntity(testDriveEntity)
                SetEntityCoords(playerPed, lastPlayerCoords)
                startCountDown = false
            end
        end
    end)
end)


function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropShadow(0, 0, 0, 55)
        SetTextEdge(0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end



RegisterNUICallback(
    "rotateright",
    function()
        SetEntityHeading(currentVeh, GetEntityHeading(currentVeh) - 2)
    end
)

RegisterNUICallback(
    "rotateleft",
    function()
        SetEntityHeading(currentVeh, GetEntityHeading(currentVeh) + 2)
    end
)


-- TEST DRIVE
    
RegisterNUICallback(
    "Vehicle",
    function(data, cb)
        EYESDeleteVehicle(currentVeh)
        local model = GetHashKey(data.vehicle)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(7)
        end
        if not DoesEntityExist(currentVeh) then
            currentVeh = CreateVehicle(model, Coords, false, true)
            if GetVehicleClassFromName(model) == 14 then
                FreezeEntityPosition(currentVeh, true)
            end
            
            cb(
                {
                    maxSpeed = GetVehicleEstimatedMaxSpeed(currentVeh) * 2,
                    Fuel = Config.GetVehFuel(currentVeh),
                    Handling = GetVehicleMaxTraction(currentVeh) * 30,
                    Acceleration = GetVehicleAcceleration(currentVeh) * 250,
                    Brake = GetVehicleMaxBraking(currentVeh) * 12.6
                }
            )

            SetVehicleEngineAndLights(currentVeh, true)
        end
    end
)

function SetVehicleDoors(vehicle, state)
    for i = 0, 3 do
        if state then
            SetVehicleDoorOpen(vehicle, i, false, false)
        else
            SetVehicleDoorShut(vehicle, i, false)
        end
    end
end

function SetVehicleEngineAndLights(vehicle, state)
    SetVehicleLights(vehicle, state and 2 or 1)
    SetVehicleEngineOn(vehicle, state, false, false)
end

-- Araç kapılarını açan fonksiyon
function OpenAllVehicleDoors(vehicle)
    local numDoors = GetNumberOfVehicleDoors(vehicle)

    for i = 0, numDoors - 1 do
        SetVehicleDoorOpen(vehicle, i, false, false)
    end
end

-- Araç kapılarını kapatan fonksiyon
function CloseAllVehicleDoors(vehicle)
    local numDoors = GetNumberOfVehicleDoors(vehicle)

    for i = 0, numDoors - 1 do
        SetVehicleDoorShut(vehicle, i, false)
    end
end



RegisterNUICallback(
    "PlateCamera",
    function(data, cb)
        local vehicle = currentVeh
        local vehicleCoords = GetEntityCoords(vehicle)
        local vehicleRot = GetEntityRotation(vehicle)
        local camPos = vehicleCoords - vector3(0.0, 5.0, -1.0)
        local cam =
        CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camPos.x, camPos.y, camPos.z, 0.0, 0.0, 0.0, 60.0, false, 0)
        AttachCamToEntity(cam, vehicle, 0.0, -5.0, 0.5, true)
        PointCamAtEntity(cam, vehicle, 0.0, 0.0, 0.0, true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 1000, true, false)
        SetCamRot(cam, vehicleRot.x, vehicleRot.y + 5.0, vehicleRot.z, 2)
        OpenAllVehicleDoors(vehicle)
    end
)

RegisterNUICallback(
    "NotPlate",
    function(data, cb)
        local Random = CustomizePlate()
        SetVehicleNumberPlateText(currentVeh, Random)
        data = CameraCoords
        local cam =
            CreateCamWithParams(
            "DEFAULT_SCRIPTED_CAMERA",
            data.posX,
            data.posY,
            data.posZ,
            data.rotX,
            data.rotY,
            data.rotZ,
            data.fov,
            true,
            0
        )
        RequestCollisionAtCoord(data.posX, data.posY, data.posZ)
        RenderScriptCams(true, true, 1, true, true)
        PointCamAtCoord(cam, data.posX, data.posY, data.posZ)
        SetFocusPosAndVel(data.posX, data.posY, data.posZ, 0.0, 0.0, 0.0)
        SetCamRot(cam, data.rotX, data.rotY + 0.0, data.rotZ, 2)
        CloseAllVehicleDoors(currentVeh)
    end
)

RegisterNUICallback(
    "SetPlate",
    function(data, cb)
        if type(data) == "table" and data.plate then
            SetVehicleNumberPlateText(currentVeh, tostring(data.plate))
        end
    end
)

function EYESDeleteVehicle(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
end

RegisterNUICallback(
    "SelectColor",
    function(data)
        local r = data.color.R
        local g = data.color.G
        local b = data.color.B

        SetVehicleCustomPrimaryColour(currentVeh, r, g, b)
        SetVehicleCustomSecondaryColour(currentVeh, r, g, b)
    end
)


local isMapOpen = false -- Variable para rastrear si el mapa está abierto

function OpenNui(data)
    SetDisplay(true, true)
    TriggerEvent("hidehud")
    
    -- Verificar si el mapa está abierto
    if IsRadarEnabled() then
        isMapOpen = true
        DisplayRadar(false)
    else
        isMapOpen = false
    end

    local cam =
        CreateCamWithParams(
        "DEFAULT_SCRIPTED_CAMERA",
        data.NuiCarViewCameraPosition.posX,
        data.NuiCarViewCameraPosition.posY,
        data.NuiCarViewCameraPosition.posZ,
        data.NuiCarViewCameraPosition.rotX,
        data.NuiCarViewCameraPosition.rotY,
        data.NuiCarViewCameraPosition.rotZ,
        data.NuiCarViewCameraPosition.fov,
        true,
        0
    )
    RequestCollisionAtCoord(
        data.NuiCarViewCameraPosition.posX,
        data.NuiCarViewCameraPosition.posY,
        data.NuiCarViewCameraPosition.posZ
    )
    RenderScriptCams(true, true, 1, true, true)
    PointCamAtCoord(
        cam,
        data.NuiCarViewCameraPosition.posX,
        data.NuiCarViewCameraPosition.posY,
        data.NuiCarViewCameraPosition.posZ
    )
    SetFocusPosAndVel(
        data.NuiCarViewCameraPosition.posX,
        data.NuiCarViewCameraPosition.posY,
        data.NuiCarViewCameraPosition.posZ,
        0.0,
        0.0,
        0.0
    )
    CustomizeCamera(isOpen)
end

function CloseNui()
    TriggerEvent("showhud")
    Citizen.Wait(1)
    CustomizeCamera(isOpen)
    SetDisplay(false)
    DestroyAllCams(true)
    RenderScriptCams(false, true, 75, true, false, false)
    SetFocusEntity(GetPlayerPed(PlayerId()))
    EYESDeleteVehicle(currentVeh)
    
    -- Restaurar el estado del mapa solo si estaba abierto previamente
    if isMapOpen then
        DisplayRadar(true)
    end
end


Citizen.CreateThread(
    function()
        EYES.Functions.CreateBlips()
        while true do
            Citizen.Wait(0)
            local getPed = PlayerPedId()
            local entity = GetEntityCoords(getPed)
            for k, v in pairs(Config.Locations) do
                local dist = #(entity - v.coords)
                if dist < 2 then
                    if dist < 2 then
                        local x, y, z = v.coords[1], v.coords[2], v.coords[3]
                        -- DrawMarker(
                        --     2,
                        --     x,
                        --     y,
                        --     z + 0.8,
                        --     0.0,
                        --     0.0,
                        --     0.0,
                        --     0.0,
                        --     0.0,
                        --     0.0,
                        --     0.3,
                        --     0.2,
                        --     0.15,
                        --     255,
                        --     255,
                        --     255,
                        --     255,
                        --     false,
                        --     false,
                        --     false,
                        --     true,
                        --     false,
                        --     false,
                        --     false
                        -- )

                        if IsControlJustPressed(0, 38) then
                            SendNUIMessage(
                                {
                                    action = "CARSHOP",
                                    cars = Config.Vehicles[v.class],
                                    category = Config.Category[v.class],
                                    class = v.class
                                }
                            )
                            Coords = v.NuiCarViewSpawnPosition
                            TestDrive = v.TestDriveSpawnPosition
                            TestDriveTime = v.TestDriveTime
                            SpawnCoords = v.BuyCarSpawnPositions
                            CameraCoords = v.NuiCarViewCameraPosition
                            OpenNui(v)
                        end
                    end
                end
            end
        end
    end
)
 

function randomNumber(length)
	local res = ""
	for i = 1, length do res = res .. string.char(math.random(48,  57)) end
	return res
end

function randomCharacter(length)
	local res = ""
	for i = 1, length do res = res .. string.char(math.random(97, 122))	end
	return res
end


 function Trim(value)
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
	local nearbyEntities = {}
	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		local playerPed = PlayerPedId()
		coords = GetEntityCoords(playerPed)
	end
	for k,entity in pairs(entities) do
		local distance = #(coords - GetEntityCoords(entity))
		if distance <= maxDistance then
			table.insert(nearbyEntities, isPlayerEntities and k or entity)
		end
	end
	return nearbyEntities
end

function GetVehicles()
	local vehicles = {}
	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end
	return vehicles
end

function konumfor(getkonum)
    for k, v in pairs(getkonum) do
        local konum = EnumerateEntitiesWithinDistance(GetVehicles(), false, v, 2.5)
        Wait(4)
        if konum[1] == nil then
            return v
        end
    end
end
 
 local display = false
 
 RegisterNUICallback("exit", function(data)
     CloseNui()
 end)
 
 function SetDisplay(bool)
     display = bool
     SetNuiFocus(bool, bool)
 end


 _RequestModel = function(hash)
    if type(hash) == "string" then hash = GetHashKey(hash) end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
    Wait(0)
    end
end



 
 DrawText3D = function(x, y, z, text)
     SetTextScale(0.35, 0.35)
     SetTextFont(2)
     SetTextProportional(1)
     SetTextColour(255, 255, 255, 215)
     SetTextEntry("STRING")
     SetTextCentre(true)
     AddTextComponentString(text)
     SetDrawOrigin(x,y,z, 0)
     DrawText(0.0, 0.0)
     local factor = (string.len(text)) / 370
     DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
     ClearDrawOrigin()
 end

 

 function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(5)
     SetTextFont(8)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

-- Interact

exports.interact:AddInteraction({
    coords = vector3(-337.913, -1370.205, 31.870483),
    distance = 3.0, -- optional
    interactDst = 1.5, -- optional
    id = 'vehicleshop1', -- needed for removing interactions
    name = 'vehicleshop1', -- optional
    options = {
        {
            label = 'Enter Vehicle Shop',
            event = "",
        },
        
    }
})

exports.interact:AddInteraction({
    coords = vector3(396.83898, -1177.834, 29.527359),
    distance = 3.0, -- optional
    interactDst = 1.5, -- optional
    id = 'boatshop1', -- needed for removing interactions
    name = 'boatshop1', -- optional
    options = {
        {
            label = 'Enter Boat Shop',
            event = "",
        },
        
    }
})