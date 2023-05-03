class Coupon < ApplicationRecord
  belongs_to :administrator, optional: true

  has_one :payment
end
