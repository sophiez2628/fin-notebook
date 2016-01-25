class NotesController < ApplicationController

  def create
    new_note = Note.new(note_params)

    if current_user
      render json: user
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  private
  def user_params
    params.require(:note).permit(:text, :lat, :lng)
  end

end
