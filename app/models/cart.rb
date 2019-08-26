class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :purchase_quantity, length:{ in: 1..100}  #購入枚数最大100個まで受付

  # validates :check, presence: true
end
