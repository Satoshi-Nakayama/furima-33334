class OrderAddress
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :zip_code, :prefecture, :city, :address_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "is invalid." }
    validates :token
  end

  validates :prefecture, numericality: { other_than: 1, message: "select  " }


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture: prefecture, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end