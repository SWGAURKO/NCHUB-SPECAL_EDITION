local QBCore = exports['qb-core']:GetCoreObject()   

RegisterNetEvent('jissuunnn-taco:client:Eat', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Munching..", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)

RegisterNetEvent('jissuunnn-taco:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)  

-- Beef Taco
RegisterNetEvent('jissuunnn-taco:client:makeBeefTaco', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'ground-beef', 'taco-tomato'})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("warmth", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makeBeefTaco")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ground-beef"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taco-tomato"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beef-taco"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
            TriggerEvent('jissuunnn-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Chicken Burrito
RegisterNetEvent('jissuunnn-taco:client:makeChickenBurrito', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'chicken', 'lettuce'})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("warmth", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makeChickenBurrito")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken-burrito"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
            TriggerEvent('jissuunnn-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Quesadillas
RegisterNetEvent('jissuunnn-taco:client:makeQuesadillas', function()
	local ingredients = QBCore.Functions.HasItem({"tortillas", "cheddar-cheese", "butter"})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("warmth", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makeQuesadillas")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["quesadilla"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
            TriggerEvent('jissuunnn-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Nachos
RegisterNetEvent('jissuunnn-taco:client:makeNachos', function()
	local ingredients = QBCore.Functions.HasItem({"tortilla-chips", "cheddar-cheese"})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("warmth", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makeNachos")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortilla-chips"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["nachos"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
            TriggerEvent('jissuunnn-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Coke Soda
RegisterNetEvent('jissuunnn-taco:client:makeCokeSoda', function()
	local ingredients = QBCore.Functions.HasItem({"carbonated-water", "sugar-cubes"})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("handshake", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "deepfry", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makeCokeSoda")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carbonated-water"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-cubes"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kurkakola"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- water_bottle
RegisterNetEvent('jissuunnn-taco:client:makewater_bottle', function()
	local ingredients = QBCore.Functions.HasItem({"carbonated-water", "sugar-cubes"})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("handshake", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "deepfry", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makewater_bottle")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carbonated-water"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-cubes"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["water_bottle"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)
-- BEER
RegisterNetEvent('jissuunnn-taco:client:makebeer', function()
	local ingredients = QBCore.Functions.HasItem({"carbonated-water", "sugar-cubes"})
    if ingredients then
        exports["wsemotes"]:EmoteCommandStart("handshake", 1)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "deepfry", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "No problem..", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("jissuunnn-taco:server:makebeer")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carbonated-water"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-cubes"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beer"], "add", 1)
            exports["wsemotes"]:EmoteCommandStart("c", 1)
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('jissuunnn-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- MENUS --     

RegisterNetEvent('jissuunnn-taco:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('jissuunnn-taco:client:cookStation', function()
    -- SetEntityCoords(PlayerPedId(), 14.35, -1597.3, 28.65)
    -- SetEntityHeading(PlayerPedId(), 321.56)
    exports['qb-menu']:openMenu({
        {
            header = "Taco Cooking Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Beef Taco",
            txt = "Requires:</p>1x Tortillas | 1x Ground Beef | 1x Tomato",
            icon = "fa-solid fa-burger",
            params = {
                event = "jissuunnn-taco:client:makeBeefTaco",
            }
        },
        {
            header = "Quesadilla",
            txt = "Requires:</p>1x Tortillas | 1x Cheddar Cheese | 1x Butter ",
            icon = "fa-solid fa-burger",
            params = {
                event = "jissuunnn-taco:client:makeQuesadillas",
            }
        },
        {
            header = "Chicken Burrito",
            txt = "Requires:</p>1x Tortillas | 1x Chicken | 1x Lettuce",
            icon = "fa-solid fa-burger",
            params = {
                event = "jissuunnn-taco:client:makeChickenBurrito",
            }
        },
        {
            header = "Nachos",
            txt = "Requires:</p>1x Tortilla Chips | 1x Cheddar Cheese",
            icon = "fa-solid fa-burger",
            params = {
                event = "jissuunnn-taco:client:makeNachos",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "jissuunnn-taco:closemenu"
            }
        },
    })
end)

RegisterNetEvent('jissuunnn-taco:client:drinkStation', function()
    -- SetEntityCoords(PlayerPedId(), 16.26, -1598.74, 28.65)
    -- SetEntityHeading(PlayerPedId(), 230.45)
    exports['qb-menu']:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Coke Soda",
            txt = "Requires:</p>1x Carbonated Water | 1x Sugar Cubes",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "jissuunnn-taco:client:makeCokeSoda",
            }
        },
        {
            header = "Water Bottle",
            txt = "Requires:</p>1x Carbonated Water | 1x Sugar Cubes",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "jissuunnn-taco:client:makewater_bottle",
            }
        },
        {
            header = "Beer",
            txt = "Requires:</p>1x Carbonated Water | 1x Sugar Cubes",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "jissuunnn-taco:client:makebeer",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "jissuunnn-taco:closemenu"
            }
        },
    })
end)