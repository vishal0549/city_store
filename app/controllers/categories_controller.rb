# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :categories_ids

  def show
    @products = Product.where(category_id: @categories_ids)
  end

  def search
    @category = Category.find(params[:id])
    conditions = []
    params[:filters].split(',').each do |filter|
      filter_hash = filter.split('_')
      filter_value = filter_hash.map(&:to_i).select(&:nonzero?)
      if filter_hash.any?('below')
        conditions << "sale_price <= #{filter_value[0]}"
      elsif filter_hash.any?('above')
        conditions << "sale_price > #{filter_value[0]}"
      else
        conditions << "sale_price >= #{filter_value[0]} and sale_price <= #{filter_value[1]}"
      end
    end
    @products = Product.where(category_id: @categories_ids)
    @products = @products.where(conditions.join(' or ')) if conditions.present?
    render layout: false
  end

  private

  def categories_ids
    @category = Category.find(params[:id])
    @categories_ids = [@category.id]
    @categories_ids += @category.sub_categories.pluck(:id)
    @categories_ids += @category.sub_categories.map(&:sub_categories).flatten.collect(&:id)
  end
end
