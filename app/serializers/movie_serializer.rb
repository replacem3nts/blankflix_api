class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :length, :url, :urlthumb
end
