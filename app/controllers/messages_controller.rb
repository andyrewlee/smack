class MessagesController < ApplicationController
  def index
  end

  def create
    # broadcast to messages channel
    ActionCable.server.broadcast 'messages',
      message: params[:message][:body],
      username: current_user.username
    head :ok
  end
end
