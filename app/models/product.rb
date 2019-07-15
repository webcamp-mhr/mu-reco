class Product < ApplicationRecord

  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  has_many :discs
  has_many :carts

  # モデル同士の親子関係
  accepts_nested_attributes_for :artist, allow_destroy: true
  accepts_nested_attributes_for :genre, allow_destroy: true
  accepts_nested_attributes_for :label, allow_destroy: true
end
