class Disc < ApplicationRecord
  belongs_to :product
  has_many :songs_titles
end
