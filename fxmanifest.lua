fx_version "cerulean"
game "gta5"
author 'complexza'
description "Tool to find Offsets inside Shells for ps-housing"
version "1.0.0"

client_scripts 'client/*.lua'
server_scripts 'server/*.lua'

shared_script {
    '@ox_lib/init.lua',
}

lua54 'yes'