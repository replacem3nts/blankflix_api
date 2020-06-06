class Api::V1::MoviesController < ApplicationController
    
    def create
    end

    def delete
    end

    private

    def movie_params
        params.permit(:user_id, :title, :length, :url, :urlthumb)
    end
end
