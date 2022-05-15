class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :explain, presence: true
  validates :price, presence: true, numericality: {greater_than: 299,less_than: 10000000}
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :number_id, presence: true
  validates :image, presence: true
end
