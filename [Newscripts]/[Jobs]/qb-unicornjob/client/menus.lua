local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()
		exports['qb-target']:AddBoxZone("drinkstable1", vector3(247.36549, -3162.721, 0.046873), 1.05, 1.0, {
			name = "drinkstable1", 
			heading = 83.0,
			debugPoly = false,
			minZ=-1.046873,
			maxZ=1.046873,
		}, {
			options = {
			    {
				event = "qb-unicornjob:Table1",
				icon = "far fa-clipboard",
				label = "Table 1",
			    },
                {
                    event = "jim-payments:client:Charge",
                    icon = "far fa-clipboard",
                    label = "Open Cashier",
                    job = "vanilla",
                    },
			},
			distance = 1.5
		}) 

        exports['qb-target']:AddBoxZone("drinkstable2", vector3(246.81585, -3166.752, 0.17529), 1.05, 1.0, {
			name = "drinkstable2", 
			heading = 161.0,
			debugPoly = false,
			minZ=-1.17529,
			maxZ=1.17529,
		}, {
			options = {
			    {
				event = "qb-unicornjob:Table2",
				icon = "far fa-clipboard",
				label = "Table 2",
			    },
			},
			distance = 1.5
		}) 

        exports['qb-target']:AddBoxZone("drinkstable3", vector3(247.19132, -3169.896, 0.129366), 1.05, 1.0, {
			name = "drinkstable3", 
			heading = 30.0,
			debugPoly = false,
			minZ=-1.129366,
			maxZ=1.129366,
		}, {
			options = {
			    {
				event = "qb-unicornjob:Table3",
				icon = "far fa-clipboard",
				label = "Table 3",
			    },
			},
			distance = 1.5
		}) 

	exports['qb-target']:AddBoxZone("vhomebrewed", vector3(245.98002, -3160.316, 0.46219), 2.2, 0.6, {
	    name="vhomebrewed",
	    heading=300,
	    debugPoly=false,
	    minZ=-1.46219,
	    maxZ=1.46219,
	    }, {
		options = {
		    {
			event = "qb-menu:Homebrewed",
			icon = "fas fa-cocktail",
			label = "Make Food And Drinks",
			job = "vanilla",
		    },
		},
		distance = 1.5
	    })


         exports['qb-target']:AddBoxZone("vordermenu", vector3(251.70617, -3156.933, 0.048609), 1.6, 1, {
            name="vordermenu",
            heading=271,
            debugPoly=false,
            minZ=-1.048609,
            maxZ=1.048609,
        }, {
                options = {
                    {
                        event = "qb-menu:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = {["vanilla"] = 2}
                    },
                    {
                        event = "qb-unicornjob:Table4",
                        icon = "far fa-clipboard",
                        label = "Storage",
                        job = {["vanilla"] = 2}
                        },
                },
                distance = 1.5
            })

end)


-- QB-MENU --

RegisterNetEvent('qb-menu:V-Classics', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Classic Cocktails |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Espresso Martini",
            txt = "Vodka, Coffee",
            params = {
                event = "qb-unicornjob:MakeEspressoMartini"
            }
        },
        {
            
            header = "• Margarita",
            txt = "Tequila, Syrup, Fruit Mix",
            params = {
                event = "qb-unicornjob:MakeMargarita"
            }
        },
        {
            
            header = "• Manhattan",
            txt = "Whiskey, Syrup",
            params = {
                event = "qb-unicornjob:MakeManhattan"
            }
        },
        {
            
            header = "• Old Fashioned",
            txt = "Whiskey, Syrup",
            params = {
                event = "qb-unicornjob:MakeOldFashioned"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('qb-menu:OrderMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Fridge |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-unicornjob:shop"
            }
        },
        {
           
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-unicornjob:Storage2"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-menu:Homebrewed', function(data)
    exports['qb-menu']:openMenu({
        {
            id = 0,
            header = "| Foods And Drinks |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Edamame",
            txt = "Salt, Lemon",
            params = {
                event = "qb-unicornjob:MakeSparkles"
            }
        },
        {
            
            header = "• Schnitzels",
            txt = "Chicken, Salt, Oil",
            params = {
                event = "qb-unicornjob:MakeUnicorn"
            }
        },
        {
            
            header = "• Chips",
            txt = "Salt, Potato, Oil",
            params = {
                event = "qb-unicornjob:MakeDancerz"
            }
        },
        {
            
            header = "• Fried Platter",
            txt = "Onion Rings, Oil, Schnitzels",
            params = {
                event = "qb-unicornjob:MakeHulk"
            }
        },
        {
            
            header = "• Fruits Tray",
            txt = "Apple, Banana, Mango",
            params = {
                event = "qb-unicornjob:MakeClass"
            }
        },
        {
            
            header = "• Vegetable Platter",
            txt = "Cucumber, Gamba, Carrot",
            params = {
                event = "qb-unicornjob:MakeCarrot"
            }
        },
        {
            
            header = "• Hummus",
            txt = "Hummus Beans, Tehina, Salt",
            params = {
                event = "qb-unicornjob:MakeHummus"
            }
        },
        {
            
            header = "• Arais",
            txt = "Pita, Kebab, Oil",
            params = {
                event = "qb-unicornjob:MakeArais"
            }
        },
        {
            
            header = "• Trail MIX",
            txt = "Cashew, Kernels",
            params = {
                event = "qb-unicornjob:TrailMIX"
            }
        },
        {
           
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-unicornjob:bill")
AddEventHandler("qb-unicornjob:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-unicornjob:bill:player", bill.citizenid, bill.billprice)
    end
end)

