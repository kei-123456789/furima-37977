class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, :explain, :image, presence: true
  validates :price, presence: true, numericality: {greater_than: 299,less_than: 10000000}, format: {with: /\A^[0-9]+$\z/}
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :number_id ,numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :charge, :prefecture, :number

end
