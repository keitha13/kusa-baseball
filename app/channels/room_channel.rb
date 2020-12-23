class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    entry = Entry.where.not(user_id: current_user.id).where(room_id: params['room']).last
    DirectMessage.create! content: data['direct_message'], user_id: current_user.id, room_id: params['room'], entry_id: entry.id
  end
end
