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

this_is_a_map 'yes'

dependencies 'gameBuild:2372'

escrow_ignore {
    'stream/**/*.ytd',
    'stream/**/*.ydr',
    'stream/**/*.yft'
}
dependency '/assetpacks'

client_script {
    "stream/main.lua"
}