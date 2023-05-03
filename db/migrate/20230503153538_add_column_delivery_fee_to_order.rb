class AddColumnDeliveryFeeToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery_fee, :decimal, null: false, precision: 8, scale: 2, default: 0, after: :total_price
  end
end
