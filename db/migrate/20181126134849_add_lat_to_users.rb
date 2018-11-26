class AddLatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lat, :string
  end
end
