# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @new_products = Product.in_stock.where('created_at > ?', 3.days.ago).order('created_at desc') || Product.in_stock.order('created_at desc')
    @discounted_products = Product.in_stock.where('discount_percent > ?', 10).order('discount_percent desc')
    @deals = Deal.where(deleted: false)
  end

  def search
    @term = Product.in_stock.ransack(name_or_description_cont: params[:term])
    @products = @term.result.order('id desc').page(params[:page])
    if request.xhr?
      render json: @products.map { |x| { id: x.id, name: x.name, image: url_for(x.avatar), url: product_path(x), quantity: x.quantity.to_s + x.product_unit.try(:nice_name).to_s, sale_price: helpers.indian_rupee(x.sale_price) } }
      # render text: @products.pluck(:name)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
