class Province < ApplicationRecord
  has_one :tax
  has_many :users

  validates :name, presence: true
end
