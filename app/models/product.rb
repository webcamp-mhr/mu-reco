class Product < ApplicationRecord

  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  has_many :discs
  has_many :carts
end
