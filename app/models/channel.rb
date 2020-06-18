class Channel < ApplicationRecord
    has_many :channelmovies
    has_many :movies, through: :channelmovies
    scope :user_channels, lambda {|user_id| joins(:movies).where(['user_id = ?', user_id]).uniq}

    def self.find_or_create(channel_name)
        @channel = find_by(name: channel_name)
        if !@channel
            @channel = Channel.create(name: channel_name)
        end
        @channel
    end

    def user_movie(user_id)
        movies.where(['user_id = ?', user_id])
    end

end
