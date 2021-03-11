class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, :house_number
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: "is invalid."}
  end

  def save
    user = User.create
    item = Item.create
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end

end