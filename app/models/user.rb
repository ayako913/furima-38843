class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :firstkana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :lastkana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i }
end
