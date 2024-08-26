local p = nil

local function Circle(circles, seconds)
    local _circles = tonumber(circles) or 1
    local _seconds =  tonumber(seconds)

    p = promise.new()

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "circle-start",
        circles = _circles,
		time = _seconds
    })

    local result = Citizen.Await(p)

    return result
end
exports("Circle", Circle)

RegisterNUICallback("circle-fail", function(data, cb)
    p:resolve(false)
    p = nil

    SetNuiFocus(false, false)

    cb("ok")
end)

RegisterNUICallback("circle-success", function(data, cb)
    p:resolve(true)
    p = nil

    SetNuiFocus(false, false)

    cb("ok")
end)

