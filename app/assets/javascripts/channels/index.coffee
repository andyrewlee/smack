#= require cable
#= require_self
#= require_tree .

# set up connection to cable server
@App = {}
App.cable = Cable.createConsumer 'ws://localhost:28080'
