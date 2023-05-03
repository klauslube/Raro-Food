class Coupon < ApplicationRecord
  belongs_to :administrator, optional: true

  has_many :customer_order
end
