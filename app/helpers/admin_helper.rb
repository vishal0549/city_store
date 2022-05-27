# frozen_string_literal: true

module AdminHelper
  def categories_options
    Category.all.collect { |c| [c.name, c.id] }
  end

  def product_available(product)
    product.stock_available ? 'Yes' : 'Out of Stock'
  end

  def product_unit_options
    ProductUnit.all.collect { |pu| [pu.name, pu.id] }
  end

  def deal_options
    Deal.all.collect { |d| [d.name, d.id] }
  end
end
