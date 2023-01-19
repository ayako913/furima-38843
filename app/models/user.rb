class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstkana, presence: true
  validates :lastkana, presence: true
  validates :birthday, presence: true
end