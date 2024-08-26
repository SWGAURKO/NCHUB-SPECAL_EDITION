local resourceName = 'qb-core'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    QB = exports[resourceName]:GetCoreObject()
    core = QB

    PlayerData = core.Functions.GetPlayerData()

    if PlayerData?.citizenid and LocalPlayer.state.isLoggedIn then end

    -- Handles state right when the player selects their character and location.
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = core.Functions.GetPlayerData()

        TriggerServerEvent("nc_claw:playerLoaded")
    end)

    function bridge.getIdentifier()
        return PlayerData?.citizenid or cache.player
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

    shared.framework = 'qb'
end)
