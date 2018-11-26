class AddLongToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :long, :string
  end
end
