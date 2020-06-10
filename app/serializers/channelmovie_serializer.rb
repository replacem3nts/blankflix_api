class ChannelmovieSerializer < ActiveModel::Serializer
  attributes :id
  has_one :movie
  has_one :channel
end
