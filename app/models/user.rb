class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :addresses
  has_many :carts
  has_many :purchases_histories

  # モデル同士の親子関係
  accepts_nested_attributes_for :artist
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :label
end
