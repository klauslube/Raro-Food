class Card < ApplicationRecord
  belongs_to :customer, optional: true

  enum :card_type, {
    credit: 1,
    debit: 2,
  }, scopes: true, default: :credit
end
