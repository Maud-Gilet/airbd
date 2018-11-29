class RemoveCoordinatesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :lat
    remove_column :users, :long
  end
end
