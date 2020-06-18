class User < ApplicationRecord
    has_many :movies, dependent: :destroy
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, presence: true

    def movie_channels
        @channels = Channel.user_channels(self.id)
        @channels.map {|channel| ChannelSerializer.new(channel, user_id: self.id)}
    end
end
