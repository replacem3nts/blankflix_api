class Api::V1::MoviesController < ApplicationController
    before_action :authorized, only: [:create, :delete]
    
    def create
        user_id = @user.id
        @new_movie = Movie.create(user_id: user_id, url: movie_params[:url], title: movie_params[:title], smallthumb: movie_params[:smallthumb], medthumb: movie_params[:medthumb], lrgthumb: movie_params[:lrgthumb], duration: movie_params[:duration])
        @new_movie.add_if_channel(channel_params[:channel_name])
        if @new_movie
            render json: {movie: SingleMovieSerializer.new(@new_movie)}, status: 201
        else
            render json: {message: "Sorry! Movie couldn't be saved."}
        end
    end

    # def update
    # end

    def delete
        @movie_id = params[:id]
        @movie = Movie.find(@movie_id)
        is_destroyed = @movie.user_id == @user.id ? @movie.destroy : nil
        if !!is_destroyed
            render json: {movie_id: @movie_id}, status: 202
        else
            render json: {message: "Movie could not be removed."}, status: 404
        end
    end

    private
    def channel_params
        params.permit(:channel_name)
    end

    def movie_params
        params.permit(:url, :title, :url, :smallthumb, :medthumb, :lrgthumb, :duration)
    end
end
