class MessagesController < ApplicationController
  def index
  end

  def create
    ActionCable.server.broadcast 'messages',
      message: params[:message][:body],
      username: current_user.username
    head :ok
  end
end
