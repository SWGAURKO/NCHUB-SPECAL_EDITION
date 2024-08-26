local QBCore = exports['qb-core']:GetCoreObject()
-- Cigarette Pack Damage
RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('redwoodcigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('yukoncigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('cardiaquecigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
----------- / alcohol

QBCore.Functions.CreateUseableItem("vodka", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)
QBCore.Functions.CreateUseableItem("coronabeer", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona", src, item.name)
end)
QBCore.Functions.CreateUseableItem("finlandia", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona2", src, item.name)
end)
QBCore.Functions.CreateUseableItem("beluga", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona3", src, item.name)
end)
QBCore.Functions.CreateUseableItem("colazero", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona4", src, item.name)
end)
QBCore.Functions.CreateUseableItem("blu", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:Drinkblu", src, item.name)
end)
QBCore.Functions.CreateUseableItem("gregos", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona5", src, item.name)
end)
QBCore.Functions.CreateUseableItem("yellowvodka", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona89", src, item.name)
end)
QBCore.Functions.CreateUseableItem("vangoghacai", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona6", src, item.name)
end)
-- Create the cigarette pack
QBCore.Functions.CreateUseableItem("redwoodcigs", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

QBCore.Functions.CreateUseableItem("cardiaquecigs", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

QBCore.Functions.CreateUseableItem("yukoncigs", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

QBCore.Functions.CreateUseableItem("whiskey", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("adrenaline", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:adrenaline12", src, item.name)
end)

--VU
QBCore.Functions.CreateUseableItem("v-class", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:Drink", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-hulk", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-dancerz", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-unicorn", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-sparkles", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-oldfashioned", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-manhattan", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-espressomartini", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("v-margarita", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("shot-absinthe", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("shot-fireball", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("shot-snakebite", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

QBCore.Functions.CreateUseableItem("shot-redsnapper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

--Burger Shot

QBCore.Functions.CreateUseableItem("burgershot_bigking", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_bleeder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_goatwrap", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatGoat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_macaroon", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eatmacaroon", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_patatob", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatFries", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_patatos", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatFries", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_shotnuggets", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_shotrings", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatRings", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_thesmurfsicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream4", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_smurfetteicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_matchaicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream4", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_ubeicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_unicornicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_vanillaicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream3", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_chocolateicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream2", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_strawberryicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_colab", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola2", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_colas", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola2", source, item.name)
end)

QBCore.Functions.CreateUseableItem("kurkakola", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:DrinkCoffee2", source, item.name)
end)

----------- / Eat

QBCore.Functions.CreateUseableItem("sandwich", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tiramisu", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCake", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("margherita", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("quinoa", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatquinoa", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chocolate", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatChocolate", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("medfruits", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatBeans", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("vegetariana", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("capricciosa", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaShalosh", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("diavola", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("prosciuttio", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("marinara", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaShalosh", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("twerks_candy", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatChocolate", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tosti", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand", src, item.name)
    end
end)

-- CLUB77

QBCore.Functions.CreateUseableItem("clubedamame", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubhummus", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubschnitzels", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubchips", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubfriedplatter", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tripcucumber", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:tripcucumber", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubfruitstray", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubvegetableplatter", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("clubarais", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

--

QBCore.Functions.CreateUseableItem("clubtrailmix", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("gelato", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Cream", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cheesecake", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCup", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("crisps", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCrisps", src, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("donut", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaDonut", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("croissant", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:croissant", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cupchocolate", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:cupchocolate", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cookie", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:cookie", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:snikkel_candy", src, item.name)
    end
end)
----------- / Drink

QBCore.Functions.CreateUseableItem("water_bottle", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("beer", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkBeer", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coke", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ecocoffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bigfruit", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:sipshake", src, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("highnoon", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("speedball", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("gunkaccino", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bratte", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("flusher", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("caffeagra", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("wings", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "wings")
end)

QBCore.Functions.CreateUseableItem("churro", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "churro")
end)

QBCore.Functions.CreateUseableItem("burrito", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "burrito")
end)


----------- / Drug

QBCore.Functions.CreateUseableItem("lsd", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:uselsd", src)
end)

QBCore.Functions.CreateUseableItem("joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint", src)
    end
end)

QBCore.Functions.CreateUseableItem("joint2", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint2", src)
    end
end)

QBCore.Functions.CreateUseableItem("joint3", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint3", src)
    end
end)

QBCore.Functions.CreateUseableItem("joint4", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint4", src)
    end
end)

QBCore.Functions.CreateUseableItem("joint5", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint5", src)
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_joint3g", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("consumables:client:UseWeed4g", src)
        Player.Functions.RemoveItem('marijuana_joint3g', 1)
    else
        TriggerClientEvent('QBCore:Notify', source, "You need a lighter", "error")
    end
end)




QBCore.Functions.CreateUseableItem("cigar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("consumables:client:Usecigar", source, item)
    else
        TriggerClientEvent('QBCore:Notify', source, "You need a lighter", "error")
    end
end)

RegisterServerEvent('smoke:cigar', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.uses = math.random(5,7)
    if Player.PlayerData.items[item.slot].info.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['cigar'], "remove")
        Player.Functions.RemoveItem('cigar', 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)


QBCore.Functions.CreateUseableItem("coke_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Cokebaggy", src)
end)

QBCore.Functions.CreateUseableItem("weed_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:weedbaggy", src)
end)

QBCore.Functions.CreateUseableItem("crack_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Crackbaggy", src)
end)

QBCore.Functions.CreateUseableItem("xtcbaggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:EcstasyBaggy", src)
end)

QBCore.Functions.CreateUseableItem("oxy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:oxy", src)
end)

QBCore.Functions.CreateUseableItem("meth", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:meth", src)
end)

----------- / Tools

QBCore.Functions.CreateUseableItem("armor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseArmor", src)
end)

QBCore.Functions.CreateUseableItem("heavyarmor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseHeavyArmor", src)
end)

QBCore.Commands.Add("resetarmor", "Resets Vest (Police Only)", {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", src)
    else
        TriggerClientEvent('QBCore:Notify', src,  "For Police Officer Only", "error")
    end
end)

QBCore.Functions.CreateUseableItem("binoculars", function(source, item)
    local src = source
    TriggerClientEvent("binoculars:Toggle", src)
end)

QBCore.Functions.CreateUseableItem("parachute", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseParachute", src)
    end
end)

QBCore.Commands.Add("resetparachute", "Resets Parachute", {}, false, function(source, args)
    local src = source
	TriggerClientEvent("consumables:client:ResetParachute", src)
end)

RegisterNetEvent('qb-smallpenis:server:AddParachute', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("parachute", 1)
end)

----------- / Firework

QBCore.Functions.CreateUseableItem("firework1", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
end)

QBCore.Functions.CreateUseableItem("firework2", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework_v2")
end)

QBCore.Functions.CreateUseableItem("firework3", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_xmas_firework")
end)

QBCore.Functions.CreateUseableItem("firework4", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
end)

----------- / Lockpicking

QBCore.Functions.CreateUseableItem("uconnectair", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpickair", source, false)
end)

QBCore.Functions.CreateUseableItem("lockpick", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

QBCore.Functions.CreateUseableItem("pd_lockpick", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

QBCore.Functions.CreateUseableItem("advancedlockpick", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

-- Create the cigarette
QBCore.Functions.CreateUseableItem("cigarette", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName("lighter") then
			if Player.Functions.RemoveItem(item.name, 1, item.slot) then
				TriggerClientEvent("cigarettes:client:UseCigarette", src)
			end
    else
        TriggerClientEvent("QBCore:Notify", source, "You don't have a lighter", "error")
    end
end)

----------- / Unused

-- QBCore.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         TriggerClientEvent("consumables:client:UseRedSmoke", source)
--     end
-- end)

---------- / Thermal
QBCore.Functions.CreateUseableItem("thermalvision", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:useThermalVision", src, item.name)
end)

---------- / Ifak 
QBCore.Functions.CreateUseableItem("ifak",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:UseiFak", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

QBCore.Functions.CreateUseableItem("bandage2",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:bandage2", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

QBCore.Functions.CreateUseableItem("xanax",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:xanax", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

QBCore.Functions.CreateUseableItem("yod",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:yod", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

QBCore.Functions.CreateUseableItem("aspirin",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:aspirin", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

QBCore.Functions.CreateUseableItem("centrum",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:centrum", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)


--------------------burgershot---------------------------------------------------

--Drinks
QBCore.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-mshake", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkShake", src, item.name)
    end
end)

--Food
QBCore.Functions.CreateUseableItem("burger-bleeder", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco-bleeder", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatTaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chicken-burrito", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatmacaroon2", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("nachos", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCrisps", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("quesadilla", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatquesadilla", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("beef-taco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatTaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco-moneyshot", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-torpedo", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco-torpedo", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco-heartstopper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-meatfree", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("taco-meatfree", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-fries", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatFries", src, item.name)
    end
end)

------------Project Pangash
--restro
QBCore.Functions.CreateUseableItem("pangash_bhat", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("morog_polao", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("dim_polao", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("kacci", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bengali_platter", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("roshomalai", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cha", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cocacola", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ecola", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola3", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("clubcola", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola3", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("sprunk", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Sprite", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("clubsprite", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Sprite", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("borhani", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("zirapani", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("fuchka", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)