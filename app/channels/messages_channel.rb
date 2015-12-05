class MessagesChannel < ApplicationCable::Channel
  # subscribed method called when client subscribes to channel
  def subscribed
    # starts streaming broadcasts to all users subscribed to messages
    stream_from 'messages'
  end
end
