class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.boolean :status
      t.references :album, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
