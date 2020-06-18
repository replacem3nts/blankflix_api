class MovieSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :smallthumb, :medthumb, :lrgthumb, :duration
end
