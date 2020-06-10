class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:persist_login, :update, :destroy]

    def show
        @user = User.find(1)
        render json: {user: UserSerializer.new(@user)}
    end
    
    def persist_login
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
    end

    def login
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            wristband = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: wristband}, status: 200
        else
            render json: {message: 'Sorry! Incorrect username or password.'}, status: 403
        end
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            wristband = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), token: wristband}, status: 201
        else
            render json: {message: 'Sorry! That username has been taken.'}, status: 403
        end
    end

    def update
        valid_update = @user.update(username: params[:username], appname: params[:appname])
        if (valid_update)
            wristband = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), token: wristband}, status: 202
        else
            render json: {message: "Sorry, you're not permitted to update another user."}, status: 403
        end
    end

    def destroy
        valid_destroy = @user.destroy
        if valid_destroy
            render json: {garbage: 'Deleted'}, status: 202
        else
            render json: {message: 'Sorry! User could not be deleted.'}, status: 403
        end
    end

    private

    def user_params
        params.permit(:username, :password, :appname)
    end
end
