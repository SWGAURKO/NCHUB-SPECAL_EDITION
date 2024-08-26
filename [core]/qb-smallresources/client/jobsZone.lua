local QBCore = exports["qb-core"]:GetCoreObject()
local isLoaded = false
local lastStatus;

local zones = {
    ["whitewidow"] = {
        coords = vector3(188.16, -241.98, 54.07),
        length = 50,
        width = 50,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["taco"] = {
        coords = vector3(364.06, -331.24, 46.96),
        length = 100,
        width = 100,
        heading = 5,
        debugPoly = false,
        polyZone = nil
    },
    ["burgershot"] = {
        coords = vector3(-1188.27, -891.8, 24.54),
        length = 50,
        width = 50,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["coolbeans"] = {
        coords = vector3(-1208.66, -1143.42, 17.64),
        length = 80,
        width = 80,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["catcafe"] = {
        coords = vector3(-586.42, -1052.39, 22.33),
        length = 85,
        width = 85,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["redline"] = {
        coords = vector3(460.83, -575.84, 34.46),
        length = 70,
        width = 70,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["vanilla"] = {
        coords = vector3(119.09, -3271.6, 31.54),
        length = 300,
        width = 300,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },
    ["yellowjack"] = {
        coords = vector3(1993.47, 3041.64, 60.35),
        length = 60,
        width = 60,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },    
    ["judge"] = {
        coords = vector3(233.51, -411.49, 126.56),
        length = 100,
        width = 100,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    },  
    ["mechanic"] = {
        coords = vector3(-1607.63, -822.23, 10.05),
        length = 100,
        width = 100,
        heading = 0,
        debugPoly = false,
        polyZone = nil
    }
}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    isLoaded = true
end)

RegisterCommand("lamelo", function() isLoaded = true end)

CreateThread(function()
    print("Loading jobs zones")
    for name, data in pairs(zones) do
        data.polyZone = BoxZone:Create(data.coords, data.length, data.width, {
            name = name,
            heading = data.heading,
            debugPoly = data.debugPoly
        })
    end

    while true do
        while not isLoaded do
            Wait(100)
        end

        Wait(5000)
        local job = QBCore.Functions.GetPlayerData().job
        if zones[job.name] then
            zone = zones[job.name]
            TriggerServerEvent("orangutan:jobsZone:updateDuty", zone.polyZone:isPointInside(GetEntityCoords(PlayerPedId())))

            if job.onduty ~= lastStatus then
                lastStatus = job.onduty
                QBCore.Functions.Notify(lastStatus and "You are now on duty" or "You are now off duty")
            end
        end
    end
end)
