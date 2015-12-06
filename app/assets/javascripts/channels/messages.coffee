App.messages = App.cable.subscriptions.create 'MessagesChannel',
  collection: -> $('#messages')

  connected: ->
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  # received gets called whenever client receives something from websocket
  received: (data) ->
    @collection().append @renderMessage(data)

  renderMessage: (data) ->
    "<p><b>[#{data.username}]:</b> #{data.message}</p>"

  followCurrentMessage: ->
    if @collection()
      @perform 'follow'
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.messages.followCurrentMessage();
