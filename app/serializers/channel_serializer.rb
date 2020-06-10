class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_movies
  
  def user_movies
    User.find(@instance_options[:user_id]).movie_ids & self.object.movie_ids
  end
end
