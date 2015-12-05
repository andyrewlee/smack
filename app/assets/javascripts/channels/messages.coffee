App.messages = App.cable.subscriptions.create 'MessagesChannel',
  # received gets called whenever client receives something from websocket
  received: (data) ->
    $('#messages').append @renderMessage(data)
  renderMessage: (data) ->
    "<p><b>[#{data.username}]:</b> #{data.message}</p>"
$('button').click ->
  alert("yea");
