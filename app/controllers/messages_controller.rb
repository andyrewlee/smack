class MessagesController < ApplicationController
  def show
    @messages = Message.all
    @users = User.all
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to @message
  end

  private
    def message_params
      params.require(:message).permit(:name)
    end
end
