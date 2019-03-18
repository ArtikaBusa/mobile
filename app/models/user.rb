class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :address, :contact_no, presence: true
  validates :email, uniqueness: true
  validates :contact_no, numericality: true, length: { maximum: 15 }, uniqueness: true
  has_many :orders, dependent: :destroy
  has_many :wishlists
  has_one_attached :profile_photo
end
