class Product < ApplicationRecord

  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  has_many :discs
  has_many :carts

  # モデル同士の親子関係
  accepts_nested_attributes_for :artist
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :label
end
