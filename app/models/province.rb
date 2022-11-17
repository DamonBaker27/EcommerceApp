class Province < ApplicationRecord
  has_one :tax
  has_many :users

  validates :name, :code, presence: true
end
