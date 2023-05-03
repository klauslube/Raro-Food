class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :administrator, null: false, foreign_key: true
      t.string :code, null: false, limit: 255
      t.string :name, null: false, limit: 255
      t.text :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.decimal :discount_amount, null: false, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end