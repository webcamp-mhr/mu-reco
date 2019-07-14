class PurchaseHistory < ApplicationRecord

  belongs_to :user
  has_many :purchases_products
end
