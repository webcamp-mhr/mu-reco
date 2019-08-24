class Address < ApplicationRecord
  validates :address_priority, :uniqueness => {:scope => :user_id}
  validates :address_priority, numericality: { less_than: 6 }
  validates :address_priority, numericality: { greater_than: 0 }
  belongs_to :user
end

