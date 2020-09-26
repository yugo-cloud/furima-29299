class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,             null: false
      t.text :description,             null: false 
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false, uniqueness: true
      t.integer :postage_id,           null: false
      t.integer :prefecture_id,        null: false
      t.integer :handling_time_id,     null: false
      t.integer :price,                null: false, foreign_key: true
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
