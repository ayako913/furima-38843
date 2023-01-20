class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { maximum:40 }
  validates :text, presence: true, length: { maximum:1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :severalday_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { in: 300..9999999, message: 'is out of setting range' }
end
