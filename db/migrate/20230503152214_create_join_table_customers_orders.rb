class CreateJoinTableCustomersOrders < ActiveRecord::Migration[7.0]
  def change
    create_join_table :customers, :orders do |t|
      t.references :coupon, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.index [:customer_id, :order_id], unique: true

      t.timestamps
    end
  end
end
