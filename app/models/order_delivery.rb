class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :telephone_number, :user_id, :item_id, :token
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id,numericality: { other_than: 1 }
  validates :municipalities, :address, :user_id, :item_id, :token, presence: true
  validates :telephone_number, presence: true, format: {with: /\A0\d{9,10}\z/}


  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building,telephone_number: telephone_number, order_id: order.id)
  end
end