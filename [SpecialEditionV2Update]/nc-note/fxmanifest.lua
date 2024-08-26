-- $$\   $$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  
-- $$$\  $$ |$$  __$$\ $$ |  $$ |$$ |  $$ |$$  __$$\ 
-- $$$$\ $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ $$\$$ |$$ |      $$$$$$$$ |$$ |  $$ |$$$$$$$\ |
-- $$ \$$$$ |$$ |      $$  __$$ |$$ |  $$ |$$  __$$\ 
-- $$ |\$$$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ | \$$ |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |
-- \__|  \__| \______/ \__|  \__| \______/ \_______/  
-- discord.gg/sgx & Patreon.com/NCHub
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
shared_scripts {
	'shared/cores.lua',
    'shared/config.lua'
}
client_scripts {
	'client/*.lua'
}
server_scripts {
    'server/*.lua'
}


escrow_ignore {
    'server/*.lua',
	'client/*.lua',
    'shared/*.lua',
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/*otf',
    'html/*png',
    'images/*.png',
    'images/*.jpg',
    'images/*.webp',
    'fonts/*.ttf',
    'fonts/*.otf'
}
lua54 'yes'
dependency '/assetpacks'