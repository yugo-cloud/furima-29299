class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number, :order, :item, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture, city: city, phone_number: phone_number, address: address, building_name: building_name,order_id: order.id)
  end
end