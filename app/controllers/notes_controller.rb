class NotesController < ApplicationController
    before_action :set_notes, only: [:edit, :destroy]
    
    def index
        @note = Note.all
    end
    
    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to new_note_path, notice:"投稿しました！"
        else
            render 'new'
        end
    end
    
    def new
        if params[:back]
            @note = Note.new(note_params)
        else
            @note = Note.new
        end
    end
    
    def edit
    end
    
    def update
        @note = Note.find(params[:id])
        if @note.update(note_params)
            redirect_to notes_path, notice:"編集しました！"
        else
            render 'edit'
        end
    end
    
    def destroy
        @note.destroy
        redirect_to notes_path, notice:"削除しました！"
    end
    
    def confirm
        @note = Note.new(note_params)
        render :new if @note.invalid?
    end
    
    def top
    end
    
    private
    def note_params
        params.require(:note).permit(:content)
    end
    
    def set_notes
        @note = Note.find(params[:id])
    end
end
