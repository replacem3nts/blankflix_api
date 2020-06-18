class Api::V1::ChannelmoviesController < ApplicationController
    before_action :authorized, only: [:create, :delete]

    def create
        @channel = Channel.find_or_create(cm_params[:channel_name])
    end

    def delete
    end

    private

    def cm_params
        params.permit(:channel_name, :movie_id)
    end

end
