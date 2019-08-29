class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :carts
  has_many :purchases_histories

  validates :email, presence: true
  validates :user_lastname, presence: true
  validates :user_firstname, presence: true
  validates :user_lastname_kana, presence: true
  validates :user_firstname_kana, presence: true
  validates :phone_number, presence: true

  #論理削除
  acts_as_paranoid


end
