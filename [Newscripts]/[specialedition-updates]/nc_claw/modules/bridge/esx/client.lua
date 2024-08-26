local resourceName = 'es_extended'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    ESX = exports[resourceName]:getSharedObject()
    core = ESX

    PlayerData = core.GetPlayerData()

    -- Handles state right when the player selects their character and location.
    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer

        TriggerServerEvent("nc_claw:playerLoaded")
    end)

    function bridge.getIdentifier()
        return PlayerData?.identifier or cache.player
    end

    function bridge.notify(msg, type)
        lib.notify({
            description = msg,
            type = type,
        })
    end

    function bridge.progress(data)
        if lib.progressCircle(data) then
            return true
        end

        return false
    end

    shared.framework = 'esx'
end)
