class Delivery < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message:is invalid. Enter it as follows (e.g. 123-4567)}
    validates :cityaddress
    validates :address
    validates :telphone, format: { with: /\A0\d{9,10}\z/, message:is invalid. Input only number}
  end
  validates :prefecture_id, numericality: { other_than: 1 } 

end
