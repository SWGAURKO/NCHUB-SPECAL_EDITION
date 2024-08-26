RegisterNetEvent("nchub-hud:Server:HandleCallback", function(key, payload)
    local src = source
    if Koci.Callbacks[key] then
        Koci.Callbacks[key](src, payload, function(cb)
            TriggerClientEvent("nchub-hud:Client:HandleCallback", src, key, cb)
        end)
    end
end)

RegisterNetEvent("nchub-hud:Server:ErrorHandle", function(error)
    Koci.Utils:printTable(error)
end)
