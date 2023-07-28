fx_version "cerulean"
game "gta5"
description "Tool to find offests from shells. Useful for housing resources etc."
version "2.0.0"

client_script "client/*.lua"
shared_script {
    '@ox_lib/init.lua',
    "config.lua"
}

lua54 'yes'

ui_page "client/html/copy.html"

file "client/html/copy.html"