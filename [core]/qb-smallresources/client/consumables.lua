-- Variables

local alcoholCount = 0
local onWeed = false
local ParachuteEquiped = false
local currentVest = nil
local currentVestTexture = nil

-- Functions

RegisterNetEvent("QBCore:Client:OnPlayerLoaded",function()
    SetEntityMaxHealth(PlayerPedId(), 200)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(1000)
    end
end

function EquipParachuteAnim()
    loadAnimDict("clothingshirt")        
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function HealOxy()
    if not healing then
        healing = true
    else
        return
    end
    
    local count = 9
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 6) 
    end
    healing = false
end

function MethBagEffect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do 
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end

function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do 
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

function JointEffect()
     if not onWeed then
         local RelieveOdd = math.random(35, 45)
         onWeed = true
         local weedTime = Config.JointEffectTime
         CreateThread(function()
             while onWeed do 
                 SetPlayerHealthRechargeMultiplier(PlayerId(), 1.8)
                 SetPedArmour(PlayerId, 100)

                 Wait(1000)
                 weedTime = weedTime - 1
                 if weedTime == RelieveOdd then
                    TriggerServerEvent('hud:server:RelieveStress', 50)
                 end
                 if weedTime <= 0 then
                     onWeed = false
                 end
            end
         end)
     end
end

function CrackBaggyEffect()
    local startStamina = 8
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do 
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 60 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function CokeBaggyEffect()
    local startStamina = 20
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do 
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 10 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))    
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

function AddArmor()
    local a = 15
    while a > 0 do
        Wait(math.random(750, 1150))
        a = a - 1
        AddArmourToPed(PlayerPedId(), 1)
    end
end

function AddHealth()
    if not healing then
        healing = true
    else
        return
    end
    
    local count = 30
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1) 
    end
    healing = false
end

-- Events

RegisterNetEvent('consumables:client:UseJoint', function()
    exports["wsemotes"]:EmoteCommandStart("smokeweed", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint 2g..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
            TrevorEffect(math.random(1000, 5000))
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
            TrevorEffect(math.random(1000, 5000))
        end
        TriggerServerEvent('hud:server:RelieveStress', 15)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- SetPedArmour(ped, 15)
        AddArmourToPed(PlayerPedId(), 15)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseJoint2', function()
    exports["wsemotes"]:EmoteCommandStart("smokeweed", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting AK-47..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint2"], "remove")
        -- if IsPedInAnyVehicle(PlayerPedId(), false) then
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        --     TrevorEffect(math.random(1000, 5000))
        -- else
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        --     TrevorEffect(math.random(1000, 5000))
        -- end
        TriggerServerEvent('hud:server:RelieveStress', 35)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- SetPedArmour(ped, 20)
        AddArmourToPed(PlayerPedId(), 20)
        SetEntityHealth(ped, GetEntityHealth(ped) + 10)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseJoint3', function()
    exports["wsemotes"]:EmoteCommandStart("smokeweed", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting Lemon Haze..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint3"], "remove")
        -- if IsPedInAnyVehicle(PlayerPedId(), false) then
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        --     TrevorEffect(math.random(1000, 5000))
        -- else
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        --     TrevorEffect(math.random(1000, 5000))
        -- end
        TriggerServerEvent('hud:server:RelieveStress', 60)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- SetPedArmour(ped, 35)
        AddArmourToPed(PlayerPedId(), 35)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseJoint4', function()
    exports["wsemotes"]:EmoteCommandStart("smokeweed", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting OG Kush..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint4"], "remove")
        -- if IsPedInAnyVehicle(PlayerPedId(), false) then
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        --     TrevorEffect(math.random(1000, 5000))
        -- else
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        --     TrevorEffect(math.random(1000, 5000))
        -- end
        exports['ps-buffs']:SwimmingBuffEffect(60000, 1.4)
        TriggerServerEvent('hud:server:RelieveStress', 80)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- SetPedArmour(ped, 15)
        AddArmourToPed(PlayerPedId(), 15)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseJoint5', function()
    exports["wsemotes"]:EmoteCommandStart("smokeweed", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint", "Lighting Purple Haze..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint5"], "remove")
        -- if IsPedInAnyVehicle(PlayerPedId(), false) then
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        --     TrevorEffect(math.random(1000, 5000))
        -- else
        --     TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        --     TrevorEffect(math.random(1000, 5000))
        -- end
        -- exports['ps-buffs']:StaminaBuffEffect(60000, 1.4)
        TriggerServerEvent('hud:server:RelieveStress', 100)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- SetPedArmour(ped, 50)
        AddArmourToPed(PlayerPedId(), 50)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('cigarettes:client:UseCigPack', function(ItemData) -- On Item Use (registered server side)
    LocalPlayer.state:set("inv_busy", true, true)
    QBCore.Functions.Progressbar("pickup_sla", "Opening Cigarette Pack...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_clipboard@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("You got a cigarette from the pack", "success")
        TriggerServerEvent('QBCore:Server:AddItem', "cigarette", 1) -- give cigarette from pack
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cigarette"], "add")
        cigpackHp = ItemData.info.uses
        cigpackData = ItemData
        TriggerServerEvent("cigarettes:server:RemoveCigarette", cigpackHp, cigpackData)
        end, function()
        QBCore.Functions.Notify("Cancelled...", "error")
    end)
    LocalPlayer.state:set("inv_busy", false, true)
end)

-- Cigarette Use
RegisterNetEvent('cigarettes:client:UseCigarette')
AddEventHandler('cigarettes:client:UseCigarette', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting cigarette...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cigarette"], "remove") -- update cig count
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4)) -- Remove stress.
        TriggerEvent("evidence:client:SetStatus", "tobaccosmell", 300)
    end)
end)

-- RegisterNetEvent('consumables:client:Eat', function(itemName)
--     local playerPed = GetPlayerPed(-1)
--     TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
--     local x,y,z = table.unpack(GetEntityCoords(playerPed))
--     prop = CreateObject(GetHashKey("prop_food_bs_burger2"), x, y, z+0.2,  true,  true, true)
--     AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
--     ExecuteCommand("e eat")
--     QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
-- 		disableMouse = false,
-- 		disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         DeleteObject(prop)
--         TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
--         ExecuteCommand("e c")
--         TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
--     end)
-- end)

RegisterNetEvent('consumables:client:Eat', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("eat", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatRings', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("onionring", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Eatmacaroon2', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("hotdog", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating Burrito BOOM..", 12500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- exports['ps-buffs']:AddHealthBuff(60000, 600)
        -- exports['ps-buffs']:AddArmorBuff(60000, 3)
        -- exports['ps-buffs']:StaminaBuffEffect(30000, 1.4)
        -- exports['ps-buffs']:SwimmingBuffEffect(60000, 1.4)
        -- exports['ps-buffs']:AddBuff("intelligence", 60000)
        -- exports['ps-buffs']:AddBuff("strength", 60000)
        -- exports['ps-buffs']:AddBuff("hacking", 60000)
        -- TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:AddBuff("luck", 60000)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerEvent("hospital:client:HealInjuries", "full")
        -- SetPedArmour(ped, 100)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Eatmacaroon', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("macaroon", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating Macaroon..", 12500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- exports['ps-buffs']:AddHealthBuff(60000, 600)
        -- exports['ps-buffs']:AddArmorBuff(60000, 3)
        -- exports['ps-buffs']:StaminaBuffEffect(30000, 1.4)
        -- exports['ps-buffs']:SwimmingBuffEffect(60000, 1.4)
        -- exports['ps-buffs']:AddBuff("intelligence", 60000)
        -- exports['ps-buffs']:AddBuff("strength", 60000)
        -- exports['ps-buffs']:AddBuff("hacking", 60000)
        -- TrevorEffect(math.random(1000, 5000))
-- exports['ps-buffs']:AddBuff("luck", 60000)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerEvent("hospital:client:HealInjuries", "full")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatPizza', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("pizzas2", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Eat', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("dinner", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('police:client:ImpoundVehicle', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("medic", 1)
    QBCore.Functions.Progressbar("IMPOUND_VEH", "Impound Vehicle..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        -- TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        -- TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- -- TriggerServerEvent('nc-level:up', 30)
        -- print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatTaco', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("taco", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:chickenburrito', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("hotdog", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatGoat', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("taco", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        -- exports['ps-buffs']:AddArmorBuff(600000, 10)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatCup', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("xmascc2", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatCrisps', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("crisps", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Eatquesadilla', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("desert", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent("qb-rental:vehiclespawnpoliceboatcoords")
AddEventHandler("qb-rental:vehiclespawnpoliceboatcoords", function(data, cb)
  exports["wsemotes"]:EmoteCommandStart("beachring", 1)
  QBCore.Functions.Progressbar("spawnboat", "Spawning Boat..", 5000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
  disableMouse = false,
  disableCombat = true,
  }, {}, {}, {}, function() -- Done
    local model = data

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetModelAsNoLongerNeeded(model)
  
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
  
    local veh = CreateVehicle(model, playerCoords, true, false)
    exports["wsemotes"]:EmoteCommandStart("c", 1)
    Citizen.Wait(100)
    SetEntityAsMissionEntity(veh, true, true)
    SetModelAsNoLongerNeeded(model)
    SetVehicleOnGroundProperly(veh)
    SetVehicleNumberPlateText(veh, "MW"..tostring(math.random(1000, 9999)))
    local plate = GetVehicleNumberPlateText(veh)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)
    exports['cdn-fuel']:SetFuel(veh, 100)
    local plateText = GetVehicleNumberPlateText(veh)
    -- TriggerServerEvent("qb-rental:giverentalpaperServer",model ,plateText)
  
    local timeout = 10
    while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
        timeout = timeout - 1
        Wait(1000)
    end
end)
end)

RegisterNetEvent('consumables:client:EatSand', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sandwich", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 2) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatSand6', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sandwich6", 1)
    QBCore.Functions.Progressbar("eat_somethingg", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 2) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:tripcucumber', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sandwich6", 1)
    QBCore.Functions.Progressbar("eat_somethingg", "Eating This..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        exports["acidtrip"]:DoAcid(30000)
        TriggerServerEvent('hud:server:RelieveStress', 2) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Cream', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("xmasic", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent('hud:server:RelieveStress', 2) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreama", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream2', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamb", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream3', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamc", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream4', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamd", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 7500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent("food:Condiment","adrenaline")
        TriggerServerEvent('hud:server:RelieveStress', 20) 
        TriggerEvent("hospital:client:HealInjuries", "full")
        -- TriggerEvent("hospital:client:Revive")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream5', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreame", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream6', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamf", 1)
    ("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream7', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamg", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:ICECream7', function(itemName)
    -- ExecuteCommand("e xmasic")
    exports["wsemotes"]:EmoteCommandStart("icecreamh", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatCake', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("xmascc", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatBeans', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beans", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:croissant', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("croissant", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:cupchocolate', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("xmascc", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)


-- RegisterNetEvent('consumables:client:snikkel_candy', function(itemName)
--     exports["wsemotes"]:EmoteCommandStart("egobar", 1)
--     QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
-- 		disableMouse = false,
-- 		disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
--         exports["wsemotes"]:EmoteCommandStart("c", 1)
--         SetPedArmour(ped, 35)
--         TrevorEffect(math.random(1000, 5000))
--         TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
--         print("done")
--     end)
-- end)

RegisterNetEvent('consumables:client:snikkel_candy', function()
    exports["wsemotes"]:EmoteCommandStart("egobar", 1)
    local ped = PlayerPedId()
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("smoke_joint2", "Eating Crazy Candy..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["snikkel_candy"], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
            TrevorEffect(math.random(1000, 5000))
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
            TrevorEffect(math.random(1000, 5000))
        end
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', 15)
        -- SetPedArmour(ped, 100)
        -- TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:cookie', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("gingerbread", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatPizzaDonut', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("donut3", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatChocolate', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("gingerbread", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:Eatquinoa', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("dinner", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating Quinoa..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatPizzaShalosh', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("pizzas3", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

RegisterNetEvent('consumables:client:EatFries', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("fries", 1)
    QBCore.Functions.Progressbar("eat_something", "Eating..", 6000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
        print("done")
    end)
end)

-- RegisterNetEvent('consumables:client:Drink', function(itemName)
--     QBCore.Functions.Notify("Wait", "error")
--     Citizen.Wait(100* 10)
--     local playerPed = GetPlayerPed(-1)
--     TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
--     local x,y,z = table.unpack(GetEntityCoords(playerPed))
--     prop = CreateObject(GetHashKey("prop_energy_drink"), x, y, z+0.2,  true,  true, true)
--     ExecuteCommand("e drink")
--     QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
-- 		disableMouse = false,
-- 		disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         DeleteObject(prop)
--         -- TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
--         ExecuteCommand("e c")
--         TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
--     end)
-- end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("drink", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent('hud:server:RelieveStress', 2) 
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:DrinkBeer', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beer", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('qb-beanmachine:client:Eatables5', function()
    local ped = PlayerPedId()
    exports["wsemotes"]:EmoteCommandStart("egobar", 1)
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
    QBCore.Functions.Progressbar("candycanecandycane", "Eating Crazy Candy..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["snikkel_candy"], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
            TrevorEffect(math.random(1000, 5000))
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
            TrevorEffect(math.random(1000, 5000))
        end
        TriggerServerEvent('hud:server:RelieveStress', 15)
        -- SetPedArmour(ped, 30)
        -- TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:Cola', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("ecola", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:Cola2', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("colakrub", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:Sprite', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sprunk", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:Cola3', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("ecola", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:DrinkShake', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sipshakec", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:sipshake', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sipshake", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:DrinkCoffee', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("coffee", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:DrinkCoffee2', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("coffee2", 1)
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        -- TriggerServerEvent('nc-level:up', 30)
    end)
end)

RegisterNetEvent('consumables:client:use', function(itemName)
    local ped = PlayerPedId()
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    if itemName == "adrenaline" then
        QBCore.Functions.Progressbar("use_adrenaline", "using adrenaline", 5000, true, false, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@world_human_clipboard@male@idle_a",
            anim = "idle_c",
            flags = 50,
        }, {}, {}, function() -- Done
            TriggerEvent("consumables:client:Condiment")

            TriggerEvent('consumables:client:Stress', itemName)
            StopAnimTask(ped, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        end, function() -- Cancel
            StopAnimTask(ped, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
            QBCore.Functions.Notify("Canceled", "error")
        end)
    end

    --TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
end)

RegisterNetEvent('consumables:client:DrinkCorona', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beer2", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Corona..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
-- exports['ps-buffs']:AddBuff("luck", 60000)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkCorona2', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beer3", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Finlandia..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
-- exports['ps-buffs']:AddBuff("luck", 7200000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:Drinkblu', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("edrink3", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Blu..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        -- exports['ps-buffs']:StaminaBuffEffect(90000, 1.4)
        TriggerServerEvent('hud:server:RelieveStress', 100)
        -- SetPedArmour(PlayerPedId(), 100)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:adrenaline12', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("sms5", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Injecting Adrenaline..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports['ps-buffs']:StaminaBuffEffect(30000, 1.4)
        TriggerServerEvent('hud:server:RelieveStress', 100)
        -- SetPedArmour(PlayerPedId(), 100)
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        -- TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        -- TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkCorona4', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beercan3", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Colazero..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
--         TrevorEffect(math.random(1000, 5000))
-- exports['ps-buffs']:AddBuff("luck", 60000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkCorona5', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("whiskeyb", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Gregos..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:AddBuff("luck", 7200000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkCorona89', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("whiskeyb3", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Vodka..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:AddBuff("luck", 7200000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkCorona6', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("wine2", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Vangoghacai..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:AddBuff("luck", 7200000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)


RegisterNetEvent('consumables:client:DrinkCorona3', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("beer4", 1)
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking Beluga..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:AddBuff("luck", 7200000)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    QBCore.Functions.Progressbar("snort_coke", "Drinking liquor..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('dark:kiss', function(itemName)
    exports["wsemotes"]:EmoteCommandStart("blowkiss", 1)
    QBCore.Functions.Progressbar("kissingdark", "Kissing Dark..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify('You Are Blessed Now', 'success')
    end)
end)

RegisterNetEvent('ori:dead', function(itemName)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "clickcrab", 0.7)
    exports["wsemotes"]:EmoteCommandStart("pointdown", 1)
    QBCore.Functions.Progressbar("orilucky2", "Press the button...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        local src = source
        TriggerEvent('hospital:client:KillPlayer', src)
        QBCore.Functions.Notify('You Are Loser!', 'error')
        AddExplosion(177.46177, -921.4281, 31.917337, 'EXP_TAG_PROPANE', 1.0, true,false, 5.0)
    end)
end)

RegisterNetEvent('ori:lucky', function(itemName)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "clickcrab", 0.7)
    exports["wsemotes"]:EmoteCommandStart("pointdown", 1)
    QBCore.Functions.Progressbar("orilucky", "Press the button...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        exports["wsemotes"]:EmoteCommandStart("c", 1)
        QBCore.Functions.Notify('You are very lucky!', 'success')
    end)
end)

RegisterNetEvent('consumables:client:Cokebaggy', function()
    local ped = PlayerPedId()
    TriggerServerEvent("QBCore:Server:RemoveItem", "coke_baggy", 1)
    QBCore.Functions.Progressbar("snort_coke", "Quick sniff..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "coke_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coke_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
        -- TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:StaminaBuffEffect(25000, 1.4)
        -- SetPedArmour(ped, 20)
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('qb-labs:client:UseMethBag', function()
    local ped = PlayerPedId()
    TriggerServerEvent("QBCore:Server:RemoveItem", "meth_baggy", 1)
    QBCore.Functions.Progressbar("snort_cokemeth", "Smoking Meth..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "coke_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
        -- TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:StaminaBuffEffect(25000, 1.4)
        -- SetPedArmour(ped, 35)
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:weedbaggy', function()
    local ped = PlayerPedId()
    TriggerServerEvent("QBCore:Server:RemoveItem", "weed_baggy", 1)
    QBCore.Functions.Progressbar("snortweed_coke", "Smoking weed baggy..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "coke_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
        -- TrevorEffect(math.random(1000, 5000))
        -- exports['ps-buffs']:SwimmingBuffEffect(60000, 1.4)
        -- SetPedArmour(ped, 15)
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

-- RegisterNetEvent('qb-beanmachine:client:Eatables5', function()
--     local ped = PlayerPedId()
--     exports["wsemotes"]:EmoteCommandStart("egobar", 1)
--     -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)
--     QBCore.Functions.Progressbar("candycanecandycane", "Eating Crazy Candy..", 5000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
--         disableMouse = false,
--         disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["snikkel_candy"], "remove")
--         exports["wsemotes"]:EmoteCommandStart("c", 1)
--         if IsPedInAnyVehicle(PlayerPedId(), false) then
--             TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
--             TrevorEffect(math.random(1000, 5000))
--         else
--             TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
--             TrevorEffect(math.random(1000, 5000))
--         end
--         TriggerServerEvent('hud:server:RelieveStress', 15)
--         SetPedArmour(ped, 30)
--         -- TriggerEvent('animations:client:SmokeWeed')
--     end)
-- end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    local ped = PlayerPedId()
    TriggerServerEvent("QBCore:Server:RemoveItem", "crack_baggy", 1)
    QBCore.Functions.Progressbar("snort_coke", "Smoking crack..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    TriggerServerEvent("QBCore:Server:RemoveItem", "xtcbaggy", 1)
    QBCore.Functions.Progressbar("use_ecstasy", "Pops Pills", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["xtcbaggy"], "remove")
        EcstasyEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Failed", "error")
    end)
end)

RegisterNetEvent('consumables:client:useheroin', function()
    QBCore.Functions.Progressbar("use_heroin", "Taking Heroin...", 1750, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "heroin", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heroin"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        exports["acidtrip"]:DoAcid(100000)
        -- exports["qb-smallresources"]:DoAcid(240000)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:uselsd', function()
    QBCore.Functions.Progressbar("use_lsd", "Taking LSD...", 1750, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "lsd", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lsd"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        exports["acidtrip"]:DoAcid(120000)
        -- exports["qb-smallresources"]:DoAcid(240000)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)


RegisterNetEvent('consumables:client:oxy', function()
    TriggerServerEvent("QBCore:Server:RemoveItem", "oxy", 1)
    QBCore.Functions.Progressbar("use_oxy", "Healing", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oxy"], "remove")
        ClearPedBloodDamage(PlayerPedId())
		HealOxy()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:meth', function()
    TriggerServerEvent("QBCore:Server:RemoveItem", "meth", 1)
    QBCore.Functions.Progressbar("snort_meth", "Smoking Ass Meth", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
		TriggerEvent("evidence:client:SetStatus", "agitated", 300)
        MethBagEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
	end)
end)


RegisterNetEvent('consumables:client:UseWeed4g', function()
    local taskdep = nil
    local ped = PlayerPedId()
    local smokeanim = "smokeweed"
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        taskdep = "WORLD_HUMAN_DRUG_DEALER"
    end
    LocalPlayer.state:set("inv_busy", true, true)
    QBCore.Functions.Progressbar("smoke_joint", "Smoking Joint ..", 4500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    },{}, {}, {}, function() -- Done 
        LocalPlayer.state:set("inv_busy", false, true)
        if math.random(1, 3) == 1 then
            smokeanim = "smokeweed"
        elseif math.random(1, 3) == 2 then
            smokeanim = "smokeweed"
        end
        StopAnimTask(ped, "WORLD_HUMAN_DRUG_DEALER", "smokeweed", 1.0)
        TriggerServerEvent('hud:server:RelieveStress', math.random(15, 18))
        AddArmourToPed(PlayerPedId(), 100)
    end)
end)


RegisterNetEvent('consumables:client:Usecigar', function(ItemData)
    local taskdep = nil
    local smokeanim = "smoke2"
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        taskdep = "WORLD_HUMAN_SMOKING"
    end
    LocalPlayer.state:set("inv_busy", true, true)
    QBCore.Functions.Progressbar("smoke_cigar", "Lighting cigar..", 13000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    },{}, {}, {}, function() -- Done 
        LocalPlayer.state:set("inv_busy", false, true)
        if math.random(1, 3) == 1 then
            smokeanim = "smoke3"
        elseif math.random(1, 3) == 2 then
            smokeanim = "smoke3"
        end
        TriggerEvent('animations:client:EmoteCommandStart', {smokeanim})
        TriggerServerEvent('smoke:cigar', ItemData)
        TriggerServerEvent('hud:server:RelieveStress', math.random(15, 18))
    end)
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    EquipParachuteAnim()
    QBCore.Functions.Progressbar("use_parachute", "parachute using..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = PlayerPedId()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Adding Parachute Clothing
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end)
end)

RegisterNetEvent('consumables:client:ResetParachute', function()
    if ParachuteEquiped then 
        EquipParachuteAnim()
        QBCore.Functions.Progressbar("reset_parachute", "Packing parachute..", 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = { 
                outfitData = { 
                    ["bag"] = { item = 0, texture = 0} -- Removing Parachute Clothing
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent("qb-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        QBCore.Functions.Notify("You dont have a parachute!", "error")
    end
end)

-- RegisterNetEvent('consumables:client:UseArmor', function()
--     if GetPedArmour(PlayerPedId()) >= 75 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
--     QBCore.Functions.Progressbar("use_armor", "Putting on the body armour..", 5000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
-- 		disableMouse = false,
-- 		disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "remove")
--         TriggerServerEvent('hospital:server:SetArmor', 75)
--         TriggerServerEvent("QBCore:Server:RemoveItem", "armor", 1)
--         SetPedArmour(PlayerPedId(), 75)
--     end)
-- end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()

    RequestAnimDict("clothingtie") 
    while not HasAnimDictLoaded("clothingtie") do Wait(0) end
	TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 3.0, 3.0, 5000, 51, 0, false, false, false)

    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
    TriggerServerEvent("QBCore:Server:RemoveItem", "heavyarmor", 1)
    -- SetPedArmour(ped, 100)
    QBCore.Functions.Progressbar("use_heavyarmor", "Putting on body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        StopAnimTask(ped, "try_tie_positive_a", "clothingtie", 1.0)
        -- SetPedArmour(ped, 100)
        AddArmourToPed(PlayerPedId(), 100)
        --[[ if PlayerData.charinfo.gender == 0 then
            currentVest = GetPedDrawableVariation(ped, 9)
            currentVestTexture = GetPedTextureVariation(ped, 9)
            if GetPedDrawableVariation(ped, 9) == 7 then
                SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
            else
                SetPedComponentVariation(ped, 9, 5, 2, 2) -- Blue
            end
        else
            currentVest = GetPedDrawableVariation(ped, 30)
            currentVestTexture = GetPedTextureVariation(ped, 30)
            SetPedComponentVariation(ped, 9, 30, 0, 2)
        end ]]
        -- TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
        -- TriggerServerEvent("QBCore:Server:RemoveItem", "heavyarmor", 1)
        -- SetPedArmour(ped, 100)
    end)
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()

    RequestAnimDict("clothingtie") 
    while not HasAnimDictLoaded("clothingtie") do Wait(0) end
	TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 3.0, 3.0, 5000, 51, 0, false, false, false)

    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "remove")
    TriggerServerEvent("QBCore:Server:RemoveItem", "armor", 1)
    -- SetPedArmour(ped, 75)
    QBCore.Functions.Progressbar("use_heavyarmor", "Putting on body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        StopAnimTask(ped, "try_tie_positive_a", "clothingtie", 1.0)
        -- SetPedArmour(ped, 75)
        AddArmourToPed(PlayerPedId(), 75)
        --[[ if PlayerData.charinfo.gender == 0 then
            currentVest = GetPedDrawableVariation(ped, 9)
            currentVestTexture = GetPedTextureVariation(ped, 9)
            if GetPedDrawableVariation(ped, 9) == 7 then
                SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
            else
                SetPedComponentVariation(ped, 9, 5, 2, 2) -- Blue
            end
        else
            currentVest = GetPedDrawableVariation(ped, 30)
            currentVestTexture = GetPedTextureVariation(ped, 30)
            SetPedComponentVariation(ped, 9, 30, 0, 2)
        end ]]
        -- TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
        -- TriggerServerEvent("QBCore:Server:RemoveItem", "heavyarmor", 1)
        -- SetPedArmour(ped, 100)
    end)
end)

RegisterNetEvent('consumables:client:ResetArmor', function()
    local ped = PlayerPedId()
    if currentVest ~= nil and currentVestTexture ~= nil then 
        QBCore.Functions.Progressbar("remove_armor", "Removing the body armour..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 9, currentVest, currentVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent("QBCore:Server:AddItem", "heavyarmor", 1)
        end)
    else
        QBCore.Functions.Notify("You\'re not wearing a vest..", "error")
    end
end)

-- RegisterNetEvent('consumables:client:UseRedSmoke', function()
--     if ParachuteEquiped then
--         local ped = PlayerPedId()
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("inventory:client:Itembox", QBCore.Shared.Items["smoketrailred"], "remove")
--     else
--         QBCore.Functions.Notify("You need to have a paracute to activate smoke!", "error")    
--     end
-- end)

--Threads

CreateThread(function()
    while true do 
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Wait(2000)
        end
    end
end)

------------- / Thermal Vision 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(1000)
    end
end

function EquipThermalVision()
        loadAnimDict("anim@mp_helmets@on_foot")        
        TaskPlayAnim(PlayerPedId(), "anim@mp_helmets@on_foot", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    SetTimeout(400, function()
    ClearPedTasks(PlayerPedId())
    end)
end

RegisterNetEvent('consumables:client:useThermalVision', function()
EquipThermalVision()
    if IsNightvisionActive() then
        SetNightvision(false)
        SetSeethrough(false)
    else
        SetNightvision(true)
        SetSeethrough(true)
    end
end)

------------------------/ Ifak For Police and EMS

RegisterNetEvent("consumables:client:UseiFak", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying iFak", 3500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_clipboard@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ifak"], "remove")
        TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        ResetPedMovementClipset(playerPed, 0.0)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 25
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
    end, function() -- Cancel
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

-- Pavel Medic

RegisterNetEvent("consumables:client:bandage2", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying Bandage...", 3500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_clipboard@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bandage2"], "remove")
        -- TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        ResetPedMovementClipset(playerPed, 0.0)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 25
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
    end, function() -- Cancel
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

local stressReliefActive = false

RegisterNetEvent("consumables:client:xanax", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying Xanax...", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["xanax"], "remove")
        TriggerServerEvent('hud:server:RelieveStress', 5) -- Reduce stress by 5
        ResetPedMovementClipset(playerPed, 0.0)
        stressReliefActive = true -- Activate the stress relief
        Citizen.Wait(60000) -- Wait for 1 minute
        stressReliefActive = false -- Deactivate the stress relief
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Wait for 5 seconds
        if stressReliefActive then
            TriggerServerEvent('hud:server:RelieveStress', 3) -- Reduce stress by 1 every 5 seconds
        end
    end
end)

RegisterNetEvent("consumables:client:yod", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying Iodine...", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_clipboard@male@idle_a",
        anim = "idle_c",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["yod"], "remove")
        -- TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        ResetPedMovementClipset(playerPed, 0.0)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 75
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
    end, function() -- Cancel
        StopAnimTask(playerPed, "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:aspirin", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying Aspirin...", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["aspirin"], "remove")
        -- TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        ResetPedMovementClipset(playerPed, 0.0)
        local health = GetEntityHealth(playerPed)
        local maxHealth = GetEntityMaxHealth(playerPed)
        local newHealth = health + 50
        if newHealth > maxHealth then
            SetEntityHealth(playerPed, maxHealth)
        else
            SetEntityHealth(playerPed, newHealth)
        end
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:centrum", function()
    local playerPed = GetPlayerPed(-1)
    QBCore.Functions.Progressbar("use_bandage", "Applying Centrum...", 5500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        --TriggerServerEvent("QBCore:Server:RemoveItem", "ifak", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["centrum"], "remove")
        -- TriggerServerEvent('hud:server:RelieveStress', 20)
        TriggerEvent("hospital:client:HealInjuries", "full")
        exports['ps-buffs']:StaminaBuffEffect(25000, 1.5)
        ResetPedMovementClipset(playerPed, 0.0)
    --     local health = GetEntityHealth(playerPed)
    --     local maxHealth = GetEntityMaxHealth(playerPed)
    --     local newHealth = health + 50
    --     if newHealth > maxHealth then
    --         SetEntityHealth(playerPed, maxHealth)
    --     else
    --         SetEntityHealth(playerPed, newHealth)
    --     end
    -- end, function() -- Cancel
    StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Fail", "error")
    end)
end)

