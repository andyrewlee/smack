class MessagesChannel < ApplicationCable::Channel
  def follow
    stream_from 'messages'
  end
end
