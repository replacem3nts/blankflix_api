class Api::V1::ChannelmoviesController < ApplicationController
    before_action :authorized, only: [:create, :delete]

    def create
        @channel = Channel.find_or_create(cm_params[:channel_name])
        @movie = @user.movies.first
        @cm = Channelmovie.create(movie_id: @movie.id, channel_id: @channel.id)
        if @cm
            render json: {channel: ChannelSerializer.new(@channel, user_id: @user.id)}, status: 201
        else
            render json: {message: "Sorry! Could not be created."}
        end
    end

    def delete
    end

    private

    def cm_params
        params.permit(:channel_name, :movie_id)
    end

end
