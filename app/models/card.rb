class Card < ApplicationRecord
  belongs_to :customer, optional: true

  has_many :payments, dependent: :destroy
  
  enum :card_type, {
    credit: 1,
    debit: 2,
  }, scopes: true, default: :credit
end
