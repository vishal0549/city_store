# frozen_string_literal: true

class Deal < ApplicationRecord
  paginates_per 50
  has_many :products
  has_one_attached :avatar, dependent: :destroy
end
