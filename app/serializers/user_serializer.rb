class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :appname, :movie_channels
  has_many :movies
end
