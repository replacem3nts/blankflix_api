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
        @movie = Movie.find(params[:movie_id])
        @channel = Channel.find(params[:channel_id])
        @deleted = @movie.channels.delete(@channel)
        byebug
        if @deleted
            render json: {channel: ChannelSerializer.new(@channel, user_id: @user.id)}, status: 201
        else
            render json: {message: 'Sorry! Movie could not be removed.'}, status: 403
        end
    end

    private

    def cm_params
        params.permit(:channel_name, :movie_id)
    end

end
