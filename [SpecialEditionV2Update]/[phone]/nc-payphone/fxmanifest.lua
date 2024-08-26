-- $$\   $$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  
-- $$$\  $$ |$$  __$$\ $$ |  $$ |$$ |  $$ |$$  __$$\ 
-- $$$$\ $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ $$\$$ |$$ |      $$$$$$$$ |$$ |  $$ |$$$$$$$\ |
-- $$ \$$$$ |$$ |      $$  __$$ |$$ |  $$ |$$  __$$\ 
-- $$ |\$$$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ | \$$ |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |
-- \__|  \__| \______/ \__|  \__| \______/ \_______/  
-- discord.gg/sgx & Patreon.com/NCHub
fx_version "cerulean"
game { "gta5" }

author 'nc-development'
version '1.0.0'

client_scripts {
  'client.lua',
  'Config.lua',
}

server_scripts {
  'server.lua',
}

files {
  'web/index.html',
  'web/asset-manifest.json',
  'web/static/media/*.ttf',
  'web/static/media/*.otf',
  'web/static/js/*.js',
  'web/static/css/*.css',
}

ui_page 'web/index.html'


-- dependencies {
--   'qb-core',
-- }