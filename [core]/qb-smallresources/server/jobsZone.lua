local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent("orangutan:jobsZone:updateDuty", function(bool)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end
    player.Functions.SetJobDuty(bool)
end)