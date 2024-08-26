Config = {}

-- █▀ █▀▄ ▄▀▄ █▄ ▄█ ██▀ █   █ ▄▀▄ █▀▄ █▄▀
-- █▀ █▀▄ █▀█ █ ▀ █ █▄▄ ▀▄▀▄▀ ▀▄▀ █▀▄ █ █
Config.Core = "QB-Core" -- "ESX" / "QB-Core"
Config.CoreExport = function()
     return exports['qb-core']:GetCoreObject()
end

Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'

Config.Notification = function(message, type)
    if type == "success" then
         TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif type == "error" then
         TriggerEvent('QBCore:Notify', message, 'error', 5000)
    end
end

Config.Interact = {
    Enabled = false,
    Open = function(message)
         exports['qb-core']:DrawText(message, 'right')
    end,
    Close = function()
         exports['qb-core']:HideText()
    end,
}

-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Translate = {
    ['open_menu'] = "Press [E] to open the menu",
    ['menu.title'] = {icon = '', label = "Select the type of exam"},
    ['menu.theory_helicopter'] = {icon = 'far fa-file-alt', label = "Helicopter theoretical test (%s$)"},
    ['menu.practical_helicopter'] = {icon = 'fas fa-helicopter', label = "Helicopter practical test (%s$)"},
    ['menu.theory_plane'] = {icon = 'far fa-file-alt', label = "Plane theoretical test (%s$)"},
    ['menu.practical_plane'] = {icon = 'fas fa-plane', label = "Plane practical test (%s$)"},
    
    ['vehicle_was_damaged'] = "The vehicle was damaged (%s/%s)",
    ['exceeded_error_limit'] = "You have exceeded the error limit, you must return to the flight school.",
    ['started_practical'] = "You have started the practical exam, follow the examiner's instructions.",
    ['complete_practical'] = "Press ~INPUT_CONTEXT~ to complete the practical exam.",
    
    ['success_practical'] = "Congratulations, you have obtained the license.",
    ['failed_practical'] = "Unfortunately, you did not pass the licensing exam.",
    
    ['the_start_area_is_occupied'] = "The starting area is occupied.",
    
    ['not_enough_cash'] = "You don't have enough money for this exam",
    ['not_enough_cash_and_bank'] = "You don't have enough cash and money in your bank account for this exam",
    
    ['3dtext.checking_left_wheel'] = "You are checking the condition of the left wheel...",
    ['3dtext.checking_right_wheel'] = "You are checking the condition of the right wheel...",
    ['3dtext.checking_left_engine'] = "You are checking the condition of the left engine...",
    ['3dtext.checking_right_engine'] = "You are checking the condition of the right engine...",
    ['3dtext.refuelling_the_plane'] = "You are refueling the plane...",
    
    ['help.check_left_wheel'] = "Press ~INPUT_CONTEXT~ to check the left wheel",
    ['notify.checked_left_wheel'] = "You have checked the left wheel.",
    ['help.check_right_wheel'] = "Press ~INPUT_CONTEXT~ to check the right wheel",
    ['notify.checked_right_wheel'] = "You have checked the right wheel.",
    ['help.check_left_engine'] = "Press ~INPUT_CONTEXT~ to check the left engine",
    ['notify.checked_left_engine'] = "You have checked the left engine",
    ['help.check_right_engine'] = "Press ~INPUT_CONTEXT~ to check the right engine",
    ['notify.checked_right_engine'] = "You have checked the right engine",
    ['notify.vehicle_is_damaged'] = "The vehicle is damaged, you need to repair it.",
    ['help.refuel_the_plane'] = "Press ~INPUT_CONTEXT~ to refuel the plane",
    ['notify.refueled_the_plane'] = "You have refueled the plane."
    
}


-- █▄ ▄█ ▄▀▄ █ █▄ █   ▄▀▀ ██▀ ▀█▀ ▀█▀ █ █▄ █ ▄▀  ▄▀▀
-- █ ▀ █ █▀█ █ █ ▀█   ▄██ █▄▄  █   █  █ █ ▀█ ▀▄█ ▄██
Config.AccessOnMarker = false -- Do you want to use access to the exam selection menu as E in marker?
Config.UseTarget = true
Config.TargetResource = 'qb-target'
Config.Target = function()
    exports[Config.TargetResource]:AddTargetModel('s_m_y_pilot_01', {
        options = { 
            { 
                event = 'nchub_flightschool:openMenu',
                icon = 'fa-regular fa-file-lines',
                label = "Flight School"
            },
        },
        distance = 3.0 
    })
end

Config.UseSoundsUI = true -- Do you want to use interaction sounds in the UI?
Config.EnableBlur = true -- Do you want to blur the background in the game when you have the UI running?

Config.PossibleChargeByBank = true -- if you set it true, when the player does not have enough cash, it will try to take it from his bank account

Config.MaxDriveErrors = 8 -- How many maximum errors a player can receive for damaging a vehicle, after this number of errors the exam will be aborted

Config.CheckIsStartAreaIsOccupied = true -- If the maneuvering area is occupied, the practical exam will not start and the player will receive notification about it

Config.UseJerryCanProp = true
Config.JerryCanObject = joaat('w_am_jerrycan')

Config.TeleportPlayerAfterExam = true
Config.TeleportPlayerAfterFailExam = true

Config.Examiner = {
    Enabled = true, -- Do you want to use a ped as an examiner who sits with the player in the vehicle?
    SpokenCommands = true,
    SpokenLanguage = "FRS", -- "EN", "DE", "FR", "ES", "PG"
    PedModel = 'ig_fbisuit_01' -- https://wiki.rage.mp/index.php?title=Peds
}

Config.Licenses = {
    Theory = {
        ['HELICOPTER'] = {name = 'theory_helicopter', price = 5000, enabled = true},
        ['PLANE'] = {name = 'theory_plane', price = 6500, enabled = true},
    },
    Practical = {
        ['HELICOPTER'] = {name = 'practical_helicopter', price = 25000, enabled = true},
        ['PLANE'] = {name = 'practical_plane', price = 45000, enabled = true},
    }
}

Config.Questions = {
    ['HELICOPTER'] = {
        QuestionsCount = 16, -- Number of all questions for the draw pool
        QuestionToAnswer = 16, -- Questions the player will have to answer
        NeedAnswersToPass = 1, -- Number of questions a player must answer correctly to pass the theory exam
    },
    ['PLANE'] = {
        QuestionsCount = 11,
        QuestionToAnswer = 11,
        NeedAnswersToPass = 1,
    },
}

Config.Tasks = {
    ['HELICOPTER'] = {
        {label = "Start the engine", id = 1}, 
        -- DE: Starte den Motor
        -- FR: Démarre le moteur
        -- ES: Enciende el motor
        -- PT: Liga o motor
        
        {label = "Take off with an altitude of <span>0m</span>/200m", id = 2}, 
        -- DE: Climb to an altitude of <span>0m</span>/200m
        -- FR: Take off with an altitude of <span>0m</span>/200m
        -- ES: Take off at an altitude of <span>0m</span>/200m
        -- PT: Take off with an altitude of <span>0m</span>/200m
        
        {label = "Pass through checkpoints <span>0</span>/3", id = 3}, 
        -- DE: Collect all checkpoints <span>0</span>/3
        -- FR: Collect the checkpoints <span>0</span>/3
        -- ES: Collect the points <span>0</span>/3
        -- PT: Collect the checkpoint points <span>0</span>/3
        
        {label = "Perform a smooth landing", id = 6},
        -- DE: Perform a safe landing
        -- FR: Perform a safe landing
        -- ES: Perform a safe landing
        -- PT: Perform a safe landing
        
        {label = "Take off with an altitude of <span>0m</span>/175m", id = 7}, 
        -- DE: Climb to an altitude of <span>0m</span>/175m
        -- FR: Take off with an altitude of <span>0m</span>/175m
        -- ES: Take off at an altitude of <span>0m</span>/175m
        -- PT: Take off with an altitude of <span>0m</span>/175m
        
        {label = "Pass through checkpoints <span>0</span>/4", id = 8}, 
        -- DE: Collect all checkpoints <span>0</span>/4
        -- FR: Collect the checkpoints <span>0</span>/4
        -- ES: Collect the points <span>0</span>/4
        -- PT: Collect the checkpoint points <span>0</span>/4
        
        {label = "Perform an emergency landing", id = 12}, 
        -- DE: Perform an emergency landing
        -- FR: Perform an emergency landing
        -- ES: Perform an emergency landing
        -- PT: Perform an emergency landing
        
        {label = "Pass through checkpoints <span>0</span>/10", id = 13}, 
        -- DE: Collect all checkpoints <span>0</span>/10
        -- FR: Collect the checkpoints <span>0</span>/10
        -- ES: Collect the points <span>0</span>/10
        -- PT: Collect the checkpoint points <span>0</span>/10
        
        {label = "Return the helicopter to the hangar", id = 23}, 
        -- DE: Bring the helicopter back to the hangar
        -- FR: Return the helicopter to the hangar
        -- ES: Return the helicopter to the hangar
        -- PT: Return the helicopter to the hangar
    },
    ['PLANE'] = {
        {label = 'Start the engine', id = 1},
        -- DE: Starte den Motor
        -- FR: Démarre le moteur
        -- ES: Enciende el motor
        -- PT: Liga o motor
    
        {label = 'Exit the hangar', id = 2},
        -- DE: Verlasse den Hangar
        -- FR: Sors de l'hangar
        -- ES: Sal del hangar
        -- PT: Saia do hangar
    
        {label = 'Head towards the point', id = 3},
        -- DE: Begib dich zu dem Punkt
        -- FR: Va au point
        -- ES: Dirígete al punto.
        -- PT: Vai ao ponto
    
        {label = 'Head to the takeoff runway.', id = 4},
        -- DE: Begib dich zur Startbahn
        -- FR: Dirige-toi vers la piste de décollage.
        -- ES: Procede a la pista de aterrizaje
        -- PT: Siga para a pista
    
        {label = 'Take off with the airplane', id = 5},
        -- DE: Starte mit dem Flugzeug
        -- FR: Décolle avec l'avion
        -- ES: Despega con el avión
        -- PT: Descola com o avião
    
        {label = 'Pass through the checkpoints <span>0</span>/10', id = 6},
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/10
        -- FR: Collecte les points de contrôle <span>0</span>/10
        -- ES: Recolecta los puntos <span>0</span>/10
        -- PT: Colete os pontos de controlo <span>0</span>/7
    
        {label = 'Reverse into the hangar.', id = 16},
        -- DE: Parke rückwärts in den Hangar ein
        -- FR: Gare-toi en marche arrière dans le hangar.
        -- ES: Estacionate de reversa en el hangar
        -- PT: Estaciona em marcha atrás
    
        {label = 'Check the airplane conditions <span>0</span>%', id = 17},
        -- DE: Überprüfe den Zustand des Flugzeugs <span>0</span>%
        -- FR: Vérifie les conditions de aéronef à <span>0</span>%
        -- ES: Verifica el estado del avión <span>0</span>%
        -- PT: Verifique as condições do avião <span>0</span>%
    
        {label = 'Refuel the airplane', id = 18},
        -- DE: Betanke das Flugzeug
        -- FR: Ravitaille l'avion
        -- ES: Hechale gasolina el avión
        -- PT: Reabastece o avião
    
        {label = 'Head to the takeoff runway.', id = 19},
        -- DE: Begib dich zur Startbahn
        -- FR: Dirige-toi vers la piste de décollage.
        -- ES: Procede a la pista de aterrizaje
        -- PT: Siga para a pista
    
        {label = 'Take off with the airplane', id = 20},
        -- DE: Starte mit dem Flugzeug
        -- FR: Décolle avec l'avion
        -- ES: Despega con el avión
        -- PT: Descola com o avião
    
        {label = 'Pass through the checkpoints <span>0</span>/7', id = 21},
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/7
        -- FR: Collecte les points de contrôle <span>0</span>/7
        -- ES: Recolecta los puntos <span>0</span>/7
        -- PT: Colete os pontos de controlo <span>0</span>/7
    
        {label = 'Bring the airplane back to the hangar', id = 28},
        -- DE: Bringe das Flugzeug zurück
        -- FR: Ramène l'avion
        -- ES: Devuelve el avión al hangar
        -- PT: Devolve o avião
    },
}

Config.Zones = {
    ["menu"] = {
        menuType = "ox_lib", -- "esx_menu_default" / "esx_context" / "qb-menu" / "ox_lib"
        menuPosition = 'left', -- only for esx_menu_default and esx_context
        coords = vector3(-906.7846, -2978.5537, 13.9890),
        marker = {
            id = 34, -- https://docs.fivem.net/docs/game-references/markers/
            color = {115, 255, 115, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(0.65, 0.65, 0.65),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 314,
            display = 4,
            scale = 0.8,
            color = 46,
            name = "Flight School"
        }
    },
    ["return_vehicle"] = {
        ['HELICOPTER'] = {
            marker = {
                id = 1, -- https://docs.fivem.net/docs/game-references/markers/
                color = {255, 25, 25, 120}, -- R(ed), G(reen), B(lue), A(lpha)
                scale = vec(7.5, 7.5, 3.5),
                bobUpAndDown = false, -- jumping marker
                rotate = true -- rotating marker
            },
            blip = { -- https://docs.fivem.net/docs/game-references/blips/
                sprite = 467,
                display = 4,
                scale = 1.0,
                color = 2,
                name = "Helicopter School"
            }
        },
        ['PLANE'] = {
            marker = {
                id = 1, -- https://docs.fivem.net/docs/game-references/markers/
                color = {255, 25, 25, 120}, -- R(ed), G(reen), B(lue), A(lpha)
                scale = vec(10.5, 10.5, 3.5),
                bobUpAndDown = false, -- jumping marker
                rotate = true -- rotating marker
            },
            blip = { -- https://docs.fivem.net/docs/game-references/blips/
                sprite = 467,
                display = 4,
                scale = 1.0,
                color = 2,
                name = "Plane School"
            }
        },
    }
}

Config.Practical = {
    ['Vehicles'] = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
        HELICOPTER = 'frogger',
        PLANE = 'vestra',
    },
    ['Marker'] = { -- https://docs.fivem.net/docs/game-references/markers/
        id = 25, 
        size = vec(0.35, 0.35, 0.35),
        rotate = {0.0, 180.0, 0.0},
        rgba = {255, 255, 0, 140},
        rotataing = false
    },
    ['Checkpoint'] = {
        id = 13,
        id_ground = 48,
        diameter = 20.0,
        diameter_ground = 11.0,
        rgba = {0, 255, 0, 175}
    },
    ['Blip'] = { -- https://docs.fivem.net/docs/game-references/blips/
        sprite = 270,
        display = 4,
        scale = 1.0,
        color = 43,
        name = "Point"
    },
    ['SpawnPoints'] = {
        ['HELICOPTER'] = vector4(-1178.32, -2845.85, 12.95, 329.7),
        ['PLANE'] = vector4(-1650.12, -3139.33, 12.99, 335.32),
    }
}