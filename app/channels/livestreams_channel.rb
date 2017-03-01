class LivestreamsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "livestreams_#{params['livestream_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], livestream_id: data['livestream_id'])
  end
end
