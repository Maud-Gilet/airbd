class Album < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  has_many :rentals
end
