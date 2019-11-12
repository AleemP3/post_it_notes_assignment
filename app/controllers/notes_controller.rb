class NotesController < ApplicationController
  def index
    #html = display all blogs 
    @notes = Note.all 
    #render :index 
  end

  def show
    #html = specific blog 
    @note = Note.find(params[:id]) 
    #render :show
  end

  def new
    #html = form for new blog posts
    @note = Note.new
    #render :new 
  end

  def create
    #POST REQUEST
    @note = Note.new(note_param)
    if @note.save 
      redirect_to note_path(@note.id) 
    else 
      render :new 
    end 
  end 

  def edit
    #html = form for existing blog post 
    @note = Note.find(params[:id]) 
    #render :edit
  end

  def update
    #render :update
    @note = Note.find(params[:id])

    if @note.update(note_param) 
      redirect_to notes_path(@note.id)
    else
      render :edit 
    end 

  end 

  def destroy
    Note.find(params[:id]).destroy 
    redirect_to notes_path 
  end

  private 
    def note_param
      params.require(:note).permit(:note, :body)
    end 
end
