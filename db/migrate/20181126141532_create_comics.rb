class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :author
      t.string :artwork
      t.string :category
      t.string :isbn

      t.timestamps
    end
  end
end
