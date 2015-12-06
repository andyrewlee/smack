class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    ActionCable.server.broadcast 'messages',
      message: params[:message][:body], username: current_user.username
    head :ok
  end

  def show
    @message = Message.find(params[:id])
  end
end
