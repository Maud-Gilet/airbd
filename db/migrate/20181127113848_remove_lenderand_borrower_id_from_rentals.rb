class RemoveLenderandBorrowerIdFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rentals, :borrower, index: true
    remove_reference :rentals, :lender, index: true
    add_reference :rentals, :user, index: true
  end
end
