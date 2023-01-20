class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :severalday
  
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true, length: { maximum:40 }
  validates :text, presence: true, length: { maximum:1000 }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :severalday_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to:300,less_than_or_equal_to:9999999, message: 'is out of setting range' }
end
