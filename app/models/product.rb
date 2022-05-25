# frozen_string_literal: true

class Product < ApplicationRecord
  paginates_per 25

  belongs_to :category, optional: true
  has_one_attached :avatar, dependent: :destroy
  belongs_to :product_unit, optional: true
  belongs_to :deal, optional: true

  before_save :update_discount, if: ->(product) { product.retail_price_changed? || product.sale_price_changed? }

  scope :in_stock, -> { where(stock_available: true) }

  private

  def update_discount
    self.discount_percent = ((retail_price - sale_price) * 100) / retail_price
  end
end
