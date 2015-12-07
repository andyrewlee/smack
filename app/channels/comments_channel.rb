class CommentsChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "messages:#{data['message_id'].to_i}:comments"

    streams.each do |stream|
      puts stream
    end
  end

  def unfollow
    stop_all_streams
  end
end
