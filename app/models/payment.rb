class Payment < ApplicationRecord
  belongs_to :card, optional: true

  has_one: customer_order
  
  enum :status, {
    pending_payment: 1,
    paid: 2,
    overdue: 3,
    cancelled: 4  
  }, scopes: true, default: :pending_payment

  enum :payment_method, {
    pix: 1,
    invoice: 2,
    card: 3,
  }, scopes: true, default: :pix
end
