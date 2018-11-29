class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :albums, dependent: :destroy
  has_many :rentals, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :password, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
