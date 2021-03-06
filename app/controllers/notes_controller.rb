class NotesController < ApplicationController
  def new
    if current_user
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create
    new_note = Note.new({text: note_params[:text],
                         lat: note_params[:lat],
                         lng: note_params[:lng],
                         user_id: current_user.id});

    if new_note.save
      redirect_to note_url(new_note.id)
    else
      render :new
    end
  end

  def show
    render json: Note.find(params[:id].to_i)
  end

  def index
    if current_user && params[:radius] && params[:lat] && params[:lng]
      render json: Note.find_based_on_radius({radius: params[:radius],
                                              lat: params[:lat],
                                              lng: params[:lng]})
    elsif current_user
      render json: Note.all
    else
      redirect_to new_session_url
    end
  end

  private
  def note_params
    params.require(:note).permit(:text, :lat, :lng)
  end

end
