class Api::V1::ChannelmoviesController < ApplicationController
    @channelmovies = User.find(2).movies.channels
    render json: {channelmovies: ChannelmovieSerializer.new(@channelmovies)}, status: 200
end
