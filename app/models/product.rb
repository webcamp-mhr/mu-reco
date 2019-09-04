class Product < ApplicationRecord


  belongs_to :label
  belongs_to :genre
  belongs_to :artist
  has_many :discs, inverse_of: :product
  has_many :carts

  attachment :jacket_image

  acts_as_paranoid

  validates :single_album_name, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
  validates :sales_status, inclusion: {in: [true, false]}

  # 親子関係
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
end


