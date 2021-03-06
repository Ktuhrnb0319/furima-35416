class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                   null: false, default: ""
      t.text :description,               null: false
      t.integer :category_id,            null: false
      t.integer :product_state_id,       null: false
      t.integer :delivery_charge_id,     null: false
      t.integer :city_id,                null: false
      t.integer :days_to_delivery_id,    null: false
      t.integer :price,                   null: false
      t.references :user,                foreign_key: true
      t.timestamps
    end
  end
end