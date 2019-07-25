class Disc < ApplicationRecord
  belongs_to :product, optional: true  #外部キーがnilでもいける
  has_many :song_titles, inverse_of: :disc

  # 親子関係
  accepts_nested_attributes_for :song_titles, reject_if: :all_blank, allow_destroy: true
end
