class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images
  validates :title, :explain, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 299,less_than: 10000000}
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :number_id ,numericality: { other_than: 1 }
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :number
end
