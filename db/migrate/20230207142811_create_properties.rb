class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.integer :rental_period, null: false
      t.integer :price, null: false
      t.boolean :is_purchasable, null: false, default: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
