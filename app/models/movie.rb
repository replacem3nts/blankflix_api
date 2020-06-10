class Movie < ApplicationRecord
  belongs_to :user
  has_many :channelmovies
  has_many :channels, through: :channelmovies

  def movie_channels
    @channels = Channel.user_channels(self.user_id)
    @channels.map {|channel| ChannelSerializer.new(channel, user_id: self.user_id)}
  end

  def add_if_channel(channel_name)
    if channel_name !== ""
      @channel = Channel.find_or_create(channel_name)
      self.channels.push(@channel)
  end

end
