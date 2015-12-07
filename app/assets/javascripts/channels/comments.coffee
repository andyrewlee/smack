App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @collection().append @renderMessage(data)
    comments = $('#comments')
    comments.scrollTop(comments.prop('scrollHeight'));

  userIsCurrentUser: (comment) ->
    $(comment).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  renderMessage: (data) ->
    "<p><b>[#{data.username}]:</b> #{data.comment}</p>"

  followCurrentMessage: ->
    if messageId = @collection().data('message-id')
      @perform 'follow', message_id: messageId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentMessage()
