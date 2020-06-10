class Channelmovie < ApplicationRecord
  belongs_to :movie
  belongs_to :channel
end
