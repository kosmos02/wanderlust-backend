class UsersController < ApplicationController

    def create
        @user = User.new(user_params
            # username: params[:username],
            # password: params[:password],
            # name: params[:name]
        )

        if @user.valid?
            @user.save

            render json: { user: @user}, status: :created
        else
            render(
                json: {errors: @user.errors.full_messages,
                status: :unprocessable_entity
        })
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :name)
    end
    
end
