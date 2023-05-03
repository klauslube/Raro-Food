class CustomerOrder < ApplicationRecord
  belongs_to :payment
  belongs_to :coupon, optional: true
end
