class MessagesChannel < ApplicationCable::Channel
  # subscribed method called when client subscribes to channel
  def follow(data)
    # starts streaming broadcasts to all users subscribed to messages
    stream_from 'messages'
  end
end
