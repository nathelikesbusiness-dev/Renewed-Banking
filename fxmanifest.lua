fx_version 'cerulean'
game 'gta5'
version '2.1.5'

description 'Renewed Banking'
Author "uShifty#1733"
version '2.1.4'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/framework.lua',
    'client/main.lua',
    'client/menus.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework.lua',
    'server/main.lua'
}

ui_page 'web/public/index.html'

files {
  'web/public/index.html',
  'web/public/**/*',
  'locales/*.json',
  "web/public/fonts/*.woff2",
  "web/public/fonts.css"
}

provide 'qb-management'
provide 'esx_society'
