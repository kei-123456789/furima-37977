class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, :explain, :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 299,less_than: 10000000}
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :number_id ,numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :number
end
