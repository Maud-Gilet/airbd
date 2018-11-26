class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :album, foreign_key: true
      t.boolean :rented
      t.references :lender, foreign_key: {to_table: :users}
      t.references :borrower, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
