class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_orders
  has_many :orders, through: :user_orders
  belongs_to :province
  validates :name, :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
