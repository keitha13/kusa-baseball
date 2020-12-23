class Users::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @currentEntries = current_user.entries

    myRoomIds = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
    pp @anotherEntries
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @direct_messages = @room.direct_messages
      pp @direct_messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: posts)
    end
  end

  def create
    @room = Room.create(:name => "DM")
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end
end
