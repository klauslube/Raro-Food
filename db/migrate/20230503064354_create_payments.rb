class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :card, null: false, foreign_key: true
      t.integer :payment_method, null: false
      t.decimal :paid_amount, null: false, precision: 8, scale: 2, default: 0
      t.integer :status, null: false

      t.timestamps
    end
  end
end