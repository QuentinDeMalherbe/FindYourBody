class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :activities
  has_one_attached :photo
  has_many :books
  validates :first_name, :last_name, :pseudo, :photo, :phone, presence: true
end
