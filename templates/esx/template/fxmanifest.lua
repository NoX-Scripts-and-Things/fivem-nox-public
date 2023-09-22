fx_version 'cerulean'
game 'gta5'

author 'NoX Script and Things'
description 'Oh my word, another mod from NoX, Amazing ;)'

shared_scripts {
	"config.lua"
}

client_scripts {
	"client/*.lua"
}

server_scripts {
	"server/*.lua"
}

dependencies {
    'esx',
    'oxmysql',
    'nox-core'
}

lua54 'yes'