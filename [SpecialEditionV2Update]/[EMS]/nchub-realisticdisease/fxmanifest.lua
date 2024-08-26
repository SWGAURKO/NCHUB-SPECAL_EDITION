-- $$\   $$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  
-- $$$\  $$ |$$  __$$\ $$ |  $$ |$$ |  $$ |$$  __$$\ 
-- $$$$\ $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ $$\$$ |$$ |      $$$$$$$$ |$$ |  $$ |$$$$$$$\ |
-- $$ \$$$$ |$$ |      $$  __$$ |$$ |  $$ |$$  __$$\ 
-- $$ |\$$$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ | \$$ |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |
-- \__|  \__| \______/ \__|  \__| \______/ \_______/  
-- discord.gg/sgx & Patreon.com/NCHub
fx_version 'bodacious'

game 'gta5'

client_scripts { 'config.lua',  'client.lua'  }
server_scripts { '@mysql-async/lib/MySQL.lua', 'config.lua', 'server.lua'  }

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/s4.js',
    'web/fonts/*.ttf',
    'web/fonts/*.woff',
    'web/fonts/*.woff2',
    'web/Human/*.png',
    'web/items/*.png',
}

lua54 "yes"

escrow_ignore {
    'config.lua', 'client.lua' , 'server.lua', 'setup/ox-items.lua', 'setup/qb-items.lua'
} 

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'