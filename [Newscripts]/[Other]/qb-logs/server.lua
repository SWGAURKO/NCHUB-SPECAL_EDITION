RegisterServerEvent('qb-logs:server:createLog')
AddEventHandler('qb-logs:server:createLog', function(name, title, descText, tagEveryone, _src)
    if not Config.Webhooks[name] then
        return
    end

    local src = source
    if _src then
        src = _src
    end
    
    local idens = ""
    if src then
        idens = idens .. "**[Name]** " .. GetPlayerName(src) .. "\n"
        for k, v in ipairs(GetPlayerIdentifiers(src)) do
            local data = string.split(v, ':')
            local index = data[1]:gsub("^%l", string.upper)
            if data[1] == 'ip' then
                index = 'IP'
            elseif data[1] == 'discord' then
                if data[2] == '111' then
                    return
                end
                data[2] = '<@' .. data[2] .. '>'
            end

            idens = idens .. "**[" .. index .. "]** " .. data[2] .. "\n"
        end
    end

    local playerName = src and GetPlayerName(src) or "None"
    local description =  descText .. '\n\n' .. idens
    local embed = {
        {
            ["color"] = "65450",
            ["title"] = title,
            ["author"] = {
                ["name"] = 'NCHub Logs',
                ["icon_url"] = "",
            },
            ["description"] = description,
        }
    }
    
    PerformHttpRequest(Config.Webhooks[name], function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end)


function string.split(input, sep)
    local result = {}

    if sep == nil then
        sep = "%s"
    end

    for str in string.gmatch(input, "([^"..sep.."]+)") do
        table.insert(result, str)
    end

    return result
end


local weapons = {
    [-1569615261] = "Unarmed",
    [1737195953] = "Nightstick",
    [1317494643] = "Hammer",
    [-1786099057] = "Bat",
    [1141786504] = "Golfclub",
    [-2067956739] = "Crowbar",
    [-868994466] = "Melee",
    [453432689] = "Pistol",
    [-1076751822] = "SNSPistol",
    [-771403250] = "HeavyPistol",
    [1593441988] = "CombatPistol",
    [584646201] = "APPistol",
    [-1716589765] = "Pistol50",
    [324215364] = "MicroSMG",
    [736523883] = "SMG",
    [2024373456] = "SMGMk2",
    [171789620] = "CombatPDW",
    [-270015777] = "AssaultSMG",
    [961495388] = "AssaultRifleMk2",
    [-1074790547] = "AssaultRifle",
    [-2084633992] = "CarbineRifle",
    [4208062921] = "CarbineRifleMk2",
    [1649403952] = "CompactRifle",
    [-1063057011] = "SpecialCarbine",
    [-1357824103] = "AdvancedRifle",
    [-619010992] = "MachinePistol",
    [-1660422300] = "MG",
    [2144741730] = "CombatMG",
    [487013001] = "PumpShotgun",
    [2017895192] = "SawnoffShotgun",
    [-494615257] = "AssaultShotgun",
    [-1654528753] = "BullpupShotgun",
    [100416529] = "SniperRifle",
    [205991906] = "HeavySniper",
    [1119849093] = "Minigun",
    [-1716189206] = "Knife",
    [1223143800] = "Knife",
    [-1955384325] = "Knife",
    [-1833087301] = "Knife",
    [910830060] = "Knife",
    [133987706] = "Car",
    [-1553120962] = "Car",
    [-100946242] = "Animal",
    [148160082] = "Animal",
    [-842959696] = "FallDamage",
    [-1568386805] = "GrenadeLauncher",
    [1305664598] = "GrenadeLauncherSmoke",
    [-1312131151] = "RPG",
    [375527679] = "Explosion",
    [324506233] = "Explosion",
    [1752584910] = "Explosion",
    [-1813897027] = "Grenade",
    [741814745] = "StickyBomb",
    [-37975472] = "SmokeGrenade",
    [539292904] = "Explosion",
    [341774354] = "Explosion",
    [-1090665087] = "Explosion",
    [-1600701090] = "Gas",
    [615608432] = "Burn",
    [883325847] = "Burn",
    [-544306709] = "Burn",
    [-10959621] = "Drown",
    [1936677264] = "Drown"
  }
  
  RegisterNetEvent("killer")
  AddEventHandler("killer", function(attackerid)
      local source = tonumber(source)
      if source then
          local attackername = "no attacker"
          if attackerid ~= -1 then
              attackername = GetPlayerName(attackerid)
          end
          local victimped = GetPlayerPed(source)
          local victimname = GetPlayerName(source)
          local weapon = GetPedCauseOfDeath(victimped)
          weapon = weapons[weapon] or "someone weapon".."("..weapon..")"
            TriggerEvent('qb-logs:server:createLog', 'death', 'Player death:', "**"..attackername.."** ".."Killed **"..victimname.."** ".."with "..weapon, false, attackerid)
      end
  end)
  
  RegisterNetEvent("ron")
  AddEventHandler("ron", function()
    local src = source
    local playerName = GetPlayerName(src)
    TriggerEvent('qb-logs:server:createLog', 'connects', 'Player connecting:', "**"..playerName.."** ".."connected to the server.", false, src)
  end)
  
  AddEventHandler("playerDropped", function()
    local src = source
    local playerName = GetPlayerName(src)
    TriggerEvent('qb-logs:server:createLog', 'connects', 'Player disconnecting:', "**"..playerName.."** ".."disconnected from the server.", false, src)
  end);

  