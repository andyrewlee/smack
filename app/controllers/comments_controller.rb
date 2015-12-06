class CommentsController < ApplicationController
  def create
    ActionCable.server.broadcast "messages:#{params[:message_id].to_i}:comments",
      comment: params[:comment][:comment],
      username: current_user.username
    head :ok
  end
end
