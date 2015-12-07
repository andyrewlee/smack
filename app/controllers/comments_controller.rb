class CommentsController < ApplicationController
  def create
    message = Message.find(params[:message_id])
    message.comments.create(comment: params[:comment][:comment], user: current_user)
    ActionCable.server.broadcast "messages:#{params[:message_id].to_i}:comments",
      comment: params[:comment][:comment],
      username: current_user.username
    head :ok
  end
end
