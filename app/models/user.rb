class User < ApplicationRecord

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, :address, :contact_no, presence: true
  validates :email, uniqueness: true
  validates :contact_no, numericality: true, length: { maximum: 15 }, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  has_one_attached :profile_photo
end
