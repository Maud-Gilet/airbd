class AddCoordinatesToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :latitude, :float
    add_column :albums, :longitude, :float
  end
end
