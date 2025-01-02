fx_version 'adamant'

game 'gta5'

version '1.0'

description 'Military Alert'

ui_page 'index.html'

files {
  'index.html',
  'main.css',
  'main.js',
  'fonts/Roboto-Black.ttf',
  'alert.mp3'
}


client_script 'client.lua'
shared_script 'config.lua'
server_script 'server.lua'


lua54 'yes'
