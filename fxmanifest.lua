fx_version "cerulean"
game "gta5"
author 'complexza'
description "Tool to find Offsets inside Shells for ps-housing"
version "1.0.0"

client_scripts {
	'client/main.lua',
}

server_scripts {
	'server/server.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
}

lua54 'yes'