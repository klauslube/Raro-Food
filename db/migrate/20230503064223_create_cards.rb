class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name, null: false, limit: 255
      t.string :card_number, null: false, limit: 20
      t.string :CVV_code, null: false, limit: 4
      t.integer :card_type, null: false
      t.string :expiration_date, null: false

      t.timestamps
    end
  end
end