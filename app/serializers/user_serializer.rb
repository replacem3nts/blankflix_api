class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :appname
  has_many :movies
end
