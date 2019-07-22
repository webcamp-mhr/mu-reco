class Disc < ApplicationRecord
  belongs_to :product
  has_many :song_titles

  # 親子関係
  accepts_nested_attributes_for :song_titles, allow_destroy: true
end
