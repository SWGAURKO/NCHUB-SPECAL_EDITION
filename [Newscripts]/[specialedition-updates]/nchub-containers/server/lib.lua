ServerCallbacks = {}

function CreateCallback( name, cb ) ServerCallbacks[name] = cb end

function TriggerCallback( name, source, cb, ... )
    if not ServerCallbacks[name] then return end
    ServerCallbacks[name](source, cb, ...)
end

RegisterNetEvent("Server:TriggerCallback", function( name, ... )
    local src = source
    TriggerCallback(name, src, function( ... ) TriggerClientEvent("Client:TriggerCallback", src, name, ...) end, ...)
end)

function Notification_S( src, msg, type ) TriggerClientEvent("nchub-containers:client:notification", src, msg, type) end
