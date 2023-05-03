# frozen_string_literal: true

class Administrator < ApplicationRecord
  belongs_to :user

  has_many :coupon, dependent: :destroy
end
