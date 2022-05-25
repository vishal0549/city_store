# frozen_string_literal: true

class Admin::ProductsController < AdminController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.order('id desc').page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.avatar.purge if params[:product][:avatar]
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :retail_price, :sale_price, :stock_available, :avatar, :category_id, :quantity, :product_unit_id, :deal_id, :discount_percent)
  end
end
