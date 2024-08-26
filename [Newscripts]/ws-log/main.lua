local debug = false;
local headers <const> = { ['Content-Type'] = 'application/json' };
local webhooks <const> = json.decode(LoadResourceFile(GetCurrentResourceName(), 'webhooks.json'));
local QBCore = exports['qb-core']:GetCoreObject();

function string.split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
       table.insert(result, each)
    end
    return table.unpack(result);
end

function FetchPlayerIds(plyId)
    local ids = {};
    local num = GetNumPlayerIdentifiers(plyId);

    for i=1, num do
        local id = GetPlayerIdentifier(plyId, i-1);
        local key, value = id:split(":");
        ids[key] = value;
    end

    return ids, num;
end

function FetchFormatedIds(plyId)
    local player = QBCore.Functions.GetPlayer(plyId).PlayerData;
    local content = ('%s %s'):format(player.charinfo.firstname, player.charinfo.lastname);
    local ids = FetchPlayerIds(plyId);

    if ids.discord then
        if ids.steam then
            content = ("<@%s> ([%s](https://steamcommunity.com/profiles/%d))"):format(ids.discord, content, tonumber(ids.steam, 16))
        else
            content = ("<@%s>"):format(ids.discord)
        end
    elseif ids.steam then
        content = ("[%s](https://steamcommunity.com/profiles/%d)"):format(content, tonumber(ids.steam, 16));
    end

    return content;
end

exports('FetchFormatedIds', FetchFormatedIds);

function MessageCallback(err, text, headers)
    if debug then
        print('webhook response', err, text, headers);
    end
end

function GetWebhookFromName(name)
    local data = webhooks[name or 'default'] or webhooks['default'];
    return ("https://discord.com/api/webhooks/%d/%s"):format(data.guild, data.token);
end

function SendDiscordMessage(channelURL, data)
    PerformHttpRequest(channelURL, MessageCallback, 'POST', json.encode(data), headers);
end

exports('SendDiscordMessage', SendDiscordMessage);

function SendFormatedMessage(channel, title, content, fields, timestamp)
    local channelURL = GetWebhookFromName(channel);

    local msg = {
        color = 0xC70608,
        type = "rich",
        title = title,
        description = content,
        timestamp = timestamp and os.date("!%Y%m%dT%H%M%S"),
        fields = fields
    }

    return SendDiscordMessage(channelURL, { embeds = { msg } });
end

exports('SendFormatedMessage', SendFormatedMessage);

function SendMessage(channel, player, content, ...)
    SendFormatedMessage(channel, nil, FetchFormatedIds(player, content) .. " " .. content:format(...));
end

exports('SendMessage', SendMessage);
exports('Log', SendMessage);


function FSendMessage(channel, player, fields, content, ...)
    SendFormatedMessage(channel, nil, FetchFormatedIds(player, content) .. " " .. content:format(...), fields);
end

exports('FSendMessage', FSendMessage);
exports('FLog', FSendMessage);

RegisterNetEvent('log', function(channel, content, ...)
    SendMessage(channel, source, content, ...);
end);

RegisterNetEvent('ws-log:died', function()
    local src = source;
    local hash = GetPedCauseOfDeath(GetPlayerPed(src));
    local weapon = hash and QBCore.Shared.Weapons[hash] and QBCore.Shared.Weapons[hash].label;
    if weapon then
        SendMessage('death', src, 'just died by a `%s`.', weapon);
    else
        SendMessage('death', src, 'just died.');
    end
end);

RegisterNetEvent('ws-log:killed', function(killer)
    local src = source;
    local hash = GetPedCauseOfDeath(GetPlayerPed(src));
    local weapon = hash and QBCore.Shared.Weapons[hash] and QBCore.Shared.Weapons[hash].label;
    if weapon then
        SendMessage('death', killer, 'just killed %s with a `%s`.', FetchFormatedIds(src), weapon:lower());
    else
        SendMessage('death', killer, 'just killed %s.', FetchFormatedIds(src));
    end
end);

RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    SendMessage('logins', source, 'just logged in.');
end);

AddEventHandler('playerDropped', function(reason)
    SendMessage('disconnect', source, 'just logged out (%s).', reason or 'quit');
end);
