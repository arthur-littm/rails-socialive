class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :url
      t.float :price
      t.references :livestream, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
