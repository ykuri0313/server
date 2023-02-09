class CreateRentalContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :rental_contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.datetime :borrowing_date, null: false
      t.datetime :return_due_date, null: false

      t.timestamps
    end
  end
end
