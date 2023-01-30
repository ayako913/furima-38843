class OrderDelivery
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :cityaddress, :address, :buildingname, :telphone, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message:'is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :cityaddress
    validates :address
    validates :telphone, numericality: { only_integer: true, message:'is invalid. Input only number' }, format: { with: /\A0\d{9,10}\z/, message:'is too short'}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, cityaddress: cityaddress, address: address, buildingname: buildingname, telphone: telphone, order_id: order.id)
  end
end