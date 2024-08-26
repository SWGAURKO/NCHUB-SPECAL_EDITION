fx_version 'cerulean'
game 'gta5'

description 'In-Depth & Multi-Feature QB Metal Detecting Script'
version '1.0'

file 'gen_w_am_metaldetector.ytyp'

client_scripts {
    'client/**.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_script 'server/sv_main.lua'
shared_script 'config.lua'
