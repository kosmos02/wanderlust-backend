class AuthenticationController < ApplicationController

    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: {error: "Bad Username"}, status: :unauthorized
        else
            if !@user.authenticate(params[:password])
                render json: {error: "Bad Password"}, status: :unauthorized
            else
                payload= {
                    user_id: @user.id
                }

                secret = Rails.application.secret_key_base
                
                token = JWT.encode(payload, secret)
                render json: {token: token, user: @user}, status: :created
            end

        end

    end

end
