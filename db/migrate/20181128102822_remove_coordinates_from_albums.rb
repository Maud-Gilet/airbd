class RemoveCoordinatesFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :latitude
    remove_column :albums, :longitude
  end
end
