class Product < ApplicationRecord

  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  has_many :discs
  has_many :carts

  # モデル同士の親子関係
  # accepts_nested_attributes_for :artists, allow_destroy: true
  # accepts_nested_attributes_for :genres, allow_destroy: true
  # accepts_nested_attributes_for :labels, allow_destroy: true
end
