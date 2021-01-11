class PostsController < ApplicationController
    def index
        @posts= Post.all 

        render json: @posts
    end

    def create
        @post = Post.new(post_params
            # name: params[:name],
            # location: params[:location],
            # lat: params[:lat],
            # lng: params[:lng],
            # date: params[:date]
        )

        if @post.valid?
            @post.save
            render json: @post
        else
            render(
                json: {errors: @post.errors.full_messages, 
                status: :unprocessable_entity
        })
        end
    end

    def destroy
        @post= Post.find(params[:id])
        @post.destroy

        render json: @student
    end

    private

    def post_params
        params.require(:post).permit(:name, :location, :lat, :lng, :date)
    end


end
