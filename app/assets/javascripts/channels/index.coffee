#= require cable
#= require_self
#= require_tree .

# set up connection to cable server
@App = {}
App.cable = Cable.createConsumer 'ws://127.0.0.1:28080'
