CreateThread(function()
    local state = {};

    for k,v in pairs(Config.textLocations) do
        state[k] = false;
    end

    while true do
        for k,v in pairs(Config.textLocations) do
            local entityCoords = GetEntityCoords(PlayerPedId())
            local isInside = #(entityCoords - v.coords) < v.distance
            if isInside then
                if not state[k] then
                    state[k] = true

                    SendNUIMessage({
                        action = "start",
                        header = v.header
                    })

                end
            elseif state[k] then
                state[k] = false
                SendNUIMessage({
                    action = "close"
                })
            end
        end

        Wait(1)
    end
end)

-- RegisterNetEvent('cdclothing:interact:clothing', function()
--     if IsControlJustReleased(0, 38) then
--     TriggerEvent("raid_clothes:hasEnough", "clothesmenu")
-- end)

-- RegisterNetEvent('cdclothing:interact:barbermenu', function()
--     if IsControlJustReleased(0, 38) then
--     TriggerEvent("raid_clothes:hasEnough", "barbermenu")
-- end)

-- RegisterNetEvent('cdclothing:interact:tattoomenu', function()
--     if IsControlJustReleased(0, 38) then
--     TriggerEvent("raid_clothes:hasEnough", "tattoomenu")
-- end)
