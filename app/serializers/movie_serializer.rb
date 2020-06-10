class MovieSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :url, :title, :smallthumb, :medthumb, :lrgthumb, :duration
end
