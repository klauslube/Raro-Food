class Coupon < ApplicationRecord
  belongs_to :administrator, optional: true

end
