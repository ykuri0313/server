class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :is_purchasable, null: false, default: true

      t.timestamps
    end
  end
end
