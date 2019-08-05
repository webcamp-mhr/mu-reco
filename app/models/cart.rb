class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :product

  # validates :check, presence: true
end
