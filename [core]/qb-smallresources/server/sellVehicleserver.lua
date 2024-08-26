local QBCORE = exports["qb-core"]:GetCoreObject()

local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1097507414808469575/Jg_G5jmCL3_uwbmfB79dTRbKwf1ljzF_A7K01xaU7D3jN-Vvid4dBJhtRpXpXXRM2eCo"
local PRICE_OFF = 10

-- Functions
local function discordLog(content)
    local data = {username = "OOGA BOOGA", content = content, avatar_url = "https://cdn.discordapp.com/attachments/948601610169364526/1131336742016909332/takai-orangutan-blog-1280x720.jpg"}

    PerformHttpRequest(DISCORD_WEBHOOK, function(responseCode, responseText, headers)
        if responseCode ~= 204 then print(responseCode) end
    end, "POST", json.encode(data), {["Content-Type"] = "application/json"})
end


local function sellVehicle(vehiclePlate, vehicleName, vehicleEntity)
    if not vehiclePlate then return end
    
    local src = source
    local player = QBCORE.Functions.GetPlayer(src)
    local citizenID = player.PlayerData.citizenid

    MySQL.Async.fetchAll("SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND plate = @plate", { ["@citizenid"] = citizenID, ["@plate"] = vehiclePlate }, function(result)
        if not result[1] then
            TriggerClientEvent("QBCore:Notify", src, "You don't own this car, so goofy..", "error")
            return
        end

        
        local vehiclePrice = QBCORE.Shared.Vehicles[vehicleName]["price"]
        local newPrice = tonumber(vehiclePrice * PRICE_OFF / 100)

        MySQL.Async.execute("DELETE FROM player_vehicles WHERE citizenid = @citizenid AND plate = @plate", { ["@citizenid"] = citizenID, ["@plate"] = vehiclePlate })
        discordLog(string.format(
            "%s %s (%s) just sold his car (%s) for $%d ($%d (actual car price) - %d%%) 🦧", player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, citizenID, vehicleName, newPrice, vehiclePrice, PRICE_OFF
        ))

        TriggerClientEvent("QBCore:Notify", src, "Congrats for selling your car", "error")

        player.Functions.AddMoney("bank", newPrice, "Sold a car")

        TriggerClientEvent("orangutan:sellvehicle:deletevehicle", src)
    end)
end


-- Events
RegisterNetEvent("orangutan:sellvehicle:sell", sellVehicle)

-- Callbacks
QBCore.Functions.CreateCallback("orangutan:sellvehicle:getPriceOff", function(source, cb) cb(PRICE_OFF) end)