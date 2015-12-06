class MessagesController < ApplicationController
  def show
    @messages = Message.all
    @users = User.all
    @message = Message.find(params[:id])
  end
end
