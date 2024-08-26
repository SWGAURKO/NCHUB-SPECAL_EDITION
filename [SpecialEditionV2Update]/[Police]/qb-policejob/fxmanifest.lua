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

description 'qb-PoliceJob'
version '1.3.4'

shared_script 'config.lua'

client_scripts {
	'client/main.lua',
	'client/camera.lua',
	'client/interactions.lua',
	'client/job.lua',
	'client/heli.lua',
	'client/anpr.lua',
	'client/evidence.lua',
	'client/objects.lua',
	--'client/priority.lua',
	'client/lux-veh.lua',
	'client/tracker.lua'
}

server_script 'server/*.lua'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/vue.min.js',
	'html/script.js',
	'html/tablet-frame.png',
	'html/fingerprint.png',
	'html/main.css',
	'html/vcr-ocd.ttf'
}

exports {
	'duty'
}

lua54 'yes'