class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :image, null: false
      t.text :item_info, null: false
      t.string :price, null: false
      t.integer :region_id, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_id, null: false
      t.integer :shipping_day_id, null: false
      
      t.timestamps
    end
  end
end
