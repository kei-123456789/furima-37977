class Delively < ApplicationRecord
  belongs_to :order
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id,numericality: { other_than: 1 }
  validates :municipalities, :address, presence: true
  validates :telephone_number, presence: true, format: {with: /\A0[0-9]{9,10}\z/}
end
