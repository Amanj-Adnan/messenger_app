class RoomMessagesController < ApplicationController
  before_action :set_message, only: [:show ,:edit ,:update ,:destroy]

  def index
    @room_messages = RoomMessage.all
  end

  def show

    @room_messages = RoomMessage.all
    render 'index'

  end

  def new
    @room_message = RoomMessage.new
  end


  def edit
  end

  def create
    @room_message = current_user.room_message.new(room_message_params)


      if @room_message.save
         redirect_to room_path( @room_message.room_id)

      else
      redirect_to rooms_path

      end
    end


  def update
    respond_to do |format|
      if @room_message.update(room_message_params)
        format.html { redirect_to @room_messages, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room_messages }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_message.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @room_message.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

  def set_message
    @room_message = RoomMessage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_message_params
    params.require(:room_message).permit(:message , :room_id)
  end
end
