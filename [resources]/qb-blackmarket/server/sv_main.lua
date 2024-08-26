QBCore = exports['qb-core']:GetCoreObject()

local ItemList4 = {
    ['cryptopaper'] = 50,
    ['octo_coin'] = 10,
    ['ancientcoin'] = 20,
    ['antiquecoin'] = 30,
    ['goldcoin'] = 40,
}

local ItemListBee = {
    ['beeswax'] = 100,
    ['honey'] = 100,
}

local ItemList = {
    ['markedbills'] = 1500,
    ['cash'] = 1500,
    ['money'] = 1500,
    ['pogo'] = 500,
    ['necklace'] = 135,
    ['cryptostick'] = 250,
    ['tequila_bottle'] = 250,
    ['bottle'] = 50,
    ['iphone'] = 100,
    ['samsungphone'] = 100,
    ['goldchain'] = 225,
    ['10kgoldchain'] = 300,
    ['goldbar'] = 200,
    ['rolex'] = 200,
    ['ruby'] = 550,
    ['emerald'] = 390,
    ['diamond'] = 430,
    ['sapphire'] = 480,
    ['gallary_egg'] = 150,
    ['gallary_skull'] = 150,
    ['gallary_dragon'] = 150,
    ['copperore'] = 110,
    ['silverore'] = 100,
    ['ironore'] = 80,
    ['panther'] = 10000,
    ['carbon'] = 17,
    ['goldingot'] = 135,
    ['silveringot'] = 85,
    ['uncut_emerald'] = 90,
    ['uncut_ruby'] = 110,
    ['uncut_diamond'] = 130,
    ['uncut_sapphire'] = 150,
    ['emerald'] = 110,
    ['ruby'] = 145,
    ['diamond'] = 150,
    ['guitar'] = 80,
    ['gold_ring'] = 60,
    ['sapphire_ring'] = 75,
    ['emerald_ring'] = 80,
    ['ruby_necklace'] = 90,
    ['emerald_necklace'] = 120,
    ['sapphire_necklace'] = 127,
    ['diamond_necklace'] = 135,
    ['carbon'] = 127,
    ['goldore'] = 55,
    ['trophy'] =105,
    ['aquamarine_ring'] = 135,
    ['citrine_ring'] = 75,
    ['diamond_ring'] = 150,
    ['jade_ring'] = 135,
    ['onyx_ring'] = 90,
    ['ruby_ring'] = 105,
    ['tanzanite_ring'] = 120,
}

local ItemListt = {
	['boulderbadge']		 = 1000,
	['cascadebadge']		 = 1000,
	['thunderbadge']		 = 1000,
	['rainbowbadge']		 = 1000,
	['soulbadge']			 = 1000,
	['marshbadge']			 = 1000,
	['volcanobadge']		 = 1000,
	['earthbadge']			 = 1000,
	['trophybadge']			 = 15000,
	['abra']				 = 50,
	['aerodactyl']			 = 250,
	['alakazam']			 = 250,
	['arbok']				 = 50,
	['arcanine']			 = 50,
	['articuno']			 = 250,
	['beedrill']			 = 50,
	['bellsprout']			 = 50,
	['blastoise']			 = 100,
	['butterfree']			 = 50,
	['caterpie']			 = 50,
	['chansey']				 = 50,
	['charizard']			 = 100,
	['charmander']			 = 50,
	['charmeleon']			 = 50,
	['clefable']			 = 50,
	['clefairy']			 = 50,
	['cloyster']			 = 50,
	['cubone']				 = 50,
	['sandslash']			 = 50,
	['dugtrio']				 = 50,
	['dewgong']				 = 50,
	['diglett']				 = 50,
	['ditto']				 = 100,
	['doduo']				 = 50,
	['dragonair']			 = 250,
	['dragonite']			 = 250,
	['dratini']				 = 250,
	['drowzee']				 = 50,
	['eevee']				 = 50,
	['ekans']				 = 50,
	['electabuzz']			 = 50,
	['electrode']			 = 50,
	['exeggcute']			 = 50,
	['exeggutor']			 = 50,
	['farfetchd']			 = 50,
	['fearow']				 = 50,
	['flareon']				 = 50,
	['gastly']				 = 50,
	['gengar']				 = 50,
	['geodude']				 = 50,
	['gloom']				 = 50,
	['golbat']				 = 50,
	['goldeen']				 = 50,
	['golduck']				 = 50,
	['golem']				 = 50,
	['graveler']			 = 50,
	['grimer']				 = 50,
	['growlithe']			 = 50,
	['gyrarados']			 = 100,
	['haunter']				 = 50,
	['hitmonchan']			 = 100,
	['hitmonlee']			 = 100,
	['horsea']				 = 50,
	['hypno']				 = 50,
	['ivysaur']				 = 50,
	['jigglypuff']			 = 50,
	['jolteon']				 = 50,
	['jynx']				 = 100,
	['kabuto']				 = 250,
	['kabutops']			 = 250,
	['kadabra']				 = 50,
	['kakuna']				 = 50,
	['kangaskhan']			 = 50,
	['kingler']				 = 50,
	['koffing']				 = 50,
	['krabby']				 = 50,
	['lapras']				 = 50,
	['lickitung']			 = 50,
	['machamp']				 = 100,
	['machoke']				 = 50,
	['machop']				 = 50,
	['magikarp']			 = 50,
	['magmar']				 = 50,
	['magnemite']			 = 50,
	['magneton']			 = 50,
	['mankey']				 = 50,
	['marowak']				 = 50,
	['meowth']				 = 50,
	['metapod']				 = 50,
	['mew']					 = 250,
	['mewtwo']				 = 250,
	['moltres']				 = 250,
	['muk']					 = 50,
	['nidoking']			 = 100,
	['nidoqueen']			 = 100,
	['nidorina']			 = 50,
	['nidorino']			 = 50,
	['ninetails']			 = 50,
	['oddish']				 = 50,
	['omanyte']				 = 250,
	['omastar']				 = 250,
	['onix']				 = 100,
	['paras']				 = 50,
	['parasect']			 = 50,
	['persian']				 = 50,
	['pidgeotto']			 = 50,
	['pidgey']				 = 50,
	['pikachu']		 		 = 50,
	['pinsir']			 	 = 50,
	['poliwag']				 = 50,
	['poliwhirl']			 = 50,
	['poliwrath']			 = 50,
	['ponyta']				 = 50,
	['porygon']				 = 250,
	['primeape']			 = 50,
	['psyduck']				 = 50,
	['raichu']				 = 100,
	['rapidash']			 = 50,
	['raticate']			 = 50,
	['rattata']				 = 50,
	['rhydon']				 = 50,
	['rhyhorn']				 = 50,
	['sandshrew']			 = 50,
	['scyther']				 = 100,
	['seadra']				 = 50,
	['seaking']				 = 50,
	['seel']				 = 50,
	['shellder']			 = 50,
	['slowbro']				 = 50,
	['slowpoke']			 = 50,
	['snorlax']				 = 250,
	['spearow']				 = 50,
	['squirtle']			 = 50,
	['starmie']				 = 100,
	['staryu']				 = 50,
	['tangela']				 = 50,
	['tauros']				 = 50,
	['tentacool']			 = 50,
	['tentacruel']			 = 50,
	['togepi']				 = 50,
	['vaporeon']			 = 50,
	['venomoth']			 = 50,
	['venonat']				 = 50,
	['venusaur']			 = 100,
	['victreebel']			 = 50,
	['vileplume']			 = 50,
	['voltorb']				 = 50,
	['vulpix']				 = 50,
	['wartortle']			 = 50,
	['weedle']				 = 50,
	['weepinbell']			 = 50,
	['weezing']				 = 50,
	['wigglytuff']			 = 50,
	['zapdos']				 = 250,
	['zubat']				 = 50,
	['bulbasaur']			 = 50,
	['nidoran']				 = 50,
	['charizardv']			 = 700,
	['vmaxcharizard']		 = 1300,
	['rainbowvmaxcharizard'] = 2700,
	['mewv']				 = 600,
	['mewtwogx']			 = 1500,
	['rainbowmewtwogx']		 = 2400,
	['pikachuv']			 = 400,
	['vmaxpikachu']			 = 900,
	['rainbowvmaxpikachu']	 = 2000,
	['snorlaxv']			 = 500,
	['snorlaxvmax']			 = 1000,
	['snorlaxvmaxrainbow']	 = 2000,
	['venusaurv']			 = 500,
	['venusaurvmax']		 = 1200,
	['blastoisev']			 = 500,
	['blastoisevmax']		 = 1200,
}

RegisterNetEvent('qb-cryptoselling:sellitemsv', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
	local sold = {};
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList4[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList4[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    table.insert(sold, ('%dx %s - $%d'):format(Player.PlayerData.items[k].amount, Player.PlayerData.items[k].label, (ItemList4[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)))
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("crypto", price, "crypto papers items sold")
		if(price > 0) then
			-- exports["ws-log"]:Log("blackmarket", src, "just sold `$%d` in total:\n%s", price, table.concat(sold, "\n"))
            -- TriggerEvent('qb-logs:server:createLog', 'blackmarketshop', 'Blackmarket', "just sold `$%d` in total:\n%s", price, table.concat(sold, "\n"), false, src)
		end
		TriggerClientEvent('QBCore:Notify', src, " You recieved ₿" ..price.. " for your crypto papers.", 'success')
    end
end)

-- BEE

RegisterNetEvent('qb-beekeeping:sellitemsv', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
	local sold = {};
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemListBee[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemListBee[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    table.insert(sold, ('%dx %s - $%d'):format(Player.PlayerData.items[k].amount, Player.PlayerData.items[k].label, (ItemListBee[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)))
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "BeeKeeping items sold")
		if(price > 0) then
			-- exports["ws-log"]:Log("blackmarket", src, "just sold `$%d` in total:\n%s", price, table.concat(sold, "\n"))
		end
		TriggerClientEvent('QBCore:Notify', src, " You recieved $" ..price.. " for your stuff.", 'success')
    end
end)

--

RegisterNetEvent('qb-blackmarket:sellitemsv', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
	local sold = {};
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    table.insert(sold, ('%dx %s - $%d'):format(Player.PlayerData.items[k].amount, Player.PlayerData.items[k].label, (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)))
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "blackmarket items sold")
		if(price > 0) then
			-- exports["ws-log"]:Log("blackmarket", src, "just sold `$%d` in total:\n%s", price, table.concat(sold, "\n"))
		end
		TriggerClientEvent('QBCore:Notify', src, " You recieved $" ..price.. " for your stuff.", 'success')
    end
end)

RegisterNetEvent('qb-blackmarket:sellitemsv2', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
	local sold = {};
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemListt[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemListt[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    table.insert(sold, ('%dx %s - $%d'):format(Player.PlayerData.items[k].amount, Player.PlayerData.items[k].label, (ItemListt[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)))
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "blackmarket items sold")
		if(price > 0) then
			-- exports["ws-log"]:Log("blackmarket", src, "just sold `$%d` in total:\n%s", price, table.concat(sold, "\n"))
		end
		TriggerClientEvent('QBCore:Notify', src, " You recieved $" ..price.. " for your stuff.", 'success')
    end
end)

-- ItemList:
-- laptop2
-- vpn_blackmarket
-- vpn_boosting
-- electornickit
-- thermite
-- advancedlockpick
-- lockpick
-- decrypter
-- screwdriverset

RegisterNetEvent("blackmarket:darkweb", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        local info = {}
        info.uses = 10
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['laptop2'], "add", 1) 
        Player.Functions.AddItem('laptop2', 1, false, info)
        -- exports["ws-log"]:Log("pawnshop", src, "Bought Laptop for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:pacificusb", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('vpn_blackmarket', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["vpn_blackmarket"], "add")
        -- exports["ws-log"]:Log("pawnshop", src, "Bought BlackMarket VPN Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:boostingvpn", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('vpn_boosting', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["vpn_boosting"], "add")
        -- exports["ws-log"]:Log("pawnshop", src, "Bought Boosting VPN Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:electronickit", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('electronickit', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["electronickit"], "add")
        -- exports["ws-log"]:Log("pawnshop", src, "Bought Electronic Kit Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:thermite", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('thermite', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["thermite"], "add")
       -- exports["ws-log"]:Log("pawnshop", src, "Bought Thermite Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:advancedlockpick", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('advancedlockpick', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["advancedlockpick"], "add")
      --  exports["ws-log"]:Log("pawnshop", src, "Bought Advanced Lockpick Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:lockpick", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('lockpick', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["lockpick"], "add")
      --  exports["ws-log"]:Log("pawnshop", src, "Bought Lockpick Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:decrypter", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('decrypter', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["decrypter"], "add")
      --  exports["ws-log"]:Log("pawnshop", src, "Bought Decrypter Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)

RegisterNetEvent("blackmarket:screwdriverset", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 2000
    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney("cash", price)
        Player.Functions.AddItem('screwdriverset', 1)
        TriggerClientEvent("inventory:client:ItemBox",src, QBCore.Shared.Items["screwdriverset"], "add")
      --  exports["ws-log"]:Log("pawnshop", src, "Bought Screwdriverset Item for - $2000")
    else
        TriggerClientEvent("QBCore:Notify", src, "You are missing some cash.", "error")
    end
end)



