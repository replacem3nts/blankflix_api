class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:persist_login, :update, :destroy]
    
    def persist_login
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
    end

    def login
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            wristband = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: wristband}
        else
            render json: {message: 'Sorry! Incorrect username or password.'}
        end
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            wristband = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), token: wristband}, status: 201
        else
            render json: {message: 'Failed to create user'}, status: 403
        end
    end

    def update
        valid_update = @user.update(username: params[:username], appname: params[:appname])
        if (valid_update)
            wristband = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), token: wristband}
        else
            render json: {message: "Sorry, you're not permitted to update another user."}
        end
    end

    def destroy
        if @user
            @user.destroy
            render json: {message: 'User was destroyed'}
        else
            render json: {message: 'Sorry! User could not be found.'}
        end
    end

    private

    def user_params
        params.permit(:username, :password, :appname)
    end
end
