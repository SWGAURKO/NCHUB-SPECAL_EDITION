-- $$\   $$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  
-- $$$\  $$ |$$  __$$\ $$ |  $$ |$$ |  $$ |$$  __$$\ 
-- $$$$\ $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ $$\$$ |$$ |      $$$$$$$$ |$$ |  $$ |$$$$$$$\ |
-- $$ \$$$$ |$$ |      $$  __$$ |$$ |  $$ |$$  __$$\ 
-- $$ |\$$$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ | \$$ |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |
-- \__|  \__| \______/ \__|  \__| \______/ \_______/  
-- discord.gg/sgx & Patreon.com/NCHub
--this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

description 'qb-Interior'
version '1.1.0'

this_is_a_map 'yes'

client_scripts {
	'client/main.lua',
	'client/optional.lua'
}


files {
	-- 'stream/defaultshells/shellprops.ytyp',
	-- 'starter_shells_k4mb1.ytyp',
	-- 'stream/startingapt/shellpropsv11.ytyp',
	-- 'stream/bammotel/bam_motel.ytyp',
	'stream/pinkcage/gabz_pinkcage.ytyp',
}

-- Default (included)
data_file 'DLC_ITYP_REQUEST' 'starter_shells_k4mb1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/defaultshells/shellprops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/startingapt/shellpropsv11.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bammotel/bam_motel.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pinkcage/gabz_pinkcage.ytyp'
data_file 'DLC_ITYP_REQUEST' 'lev_apart_shell.ytyp'

lua54 'yes'
