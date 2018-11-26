class Rental < ApplicationRecord
  belongs_to :album
  belongs_to :lender,   foreign_key: "lender_id",   class_name: "User"
  belongs_to :borrower, foreign_key: "borrower_id", class_name: "User"
end
