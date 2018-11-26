class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.boolean :available
      t.text :description
      t.references :user, foreign_key: true
      t.references :comic, foreign_key: true

      t.timestamps
    end
  end
end
