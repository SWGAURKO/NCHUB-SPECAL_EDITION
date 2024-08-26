fx_version 'cerulean'
lua54 'yes'
use_experimental_fxv2_oal 'yes'
game 'gta5'

dependencies {
    '/server:5104',
    '/onesync',
    'ox_lib'
}

files {
    'locales/*.json'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'init.lua',
    'modules/**/shared.lua',
    'modules/**/shared/*.lua'
}

client_scripts {
    'modules/**/client.lua',
    'modules/**/client/*.lua'
}

server_scripts {
    'modules/**/server.lua',
    'modules/**/server/*.lua'
}

escrow_ignore {
    "config.lua",
    "modules/bridge/**",
    "data/**",
    "locales/**",
    "extras/**"
}
