-- https://github.com/NaorNC -- discord.gg/sgx
fx_version "cerulean"
games {
    "gta5"
 }

shared_scripts {
    -- "@ox_lib/init.lua",
    "shared/containers.lua",
    "config.lua",
    "shared/util.lua"
 }

client_scripts {
    "@PolyZone/client.lua",
    "client/lib.lua",
    "client/actions.lua",
    "client/creator.lua",
    "client/targets/functions.lua",
    "client/targets/qtarget.lua",
    "client/targets/qbtarget.lua",
    "client/targets/oxtarget.lua",
    "client/client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/lib.lua",
    "server/server.lua"
 }

lua54 "yes"
