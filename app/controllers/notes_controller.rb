class NotesController < ApplicationController
    def index
        @notes= Note.all 

        render json: @notes
    end

    def create
        @note = Note.new(note_params
            # name: params[:name],
            # message: params[:message],
            # post_id: params[:post_id]
        )

        if @note.valid?
            @note.save
            render json: @note

        else
            render json: @note.errors.full_messages.first, status: :unprocessable_entity
        end
    end


    def destroy
        @note= Note.find(params[:id])
        @note.destroy

        render json: @note
    end

    private

    def note_params
        params.require(:note).permit(:name, :message, :post_id)
    end

end
