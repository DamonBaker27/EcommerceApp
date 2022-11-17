class Tax < ApplicationRecord
  belongs_to :province
  validates :province_id, presence: true
end
