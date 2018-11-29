class Album < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  has_many :rentals, dependent: :destroy
  has_many :requests, dependent: :destroy
end
