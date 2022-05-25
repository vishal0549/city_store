# frozen_string_literal: true

class Category < ApplicationRecord
  paginates_per 50
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id'

  belongs_to :parent, class_name: 'Category', optional: true
  has_one_attached :avatar, dependent: :destroy
  scope :main, -> { where(parent_id: nil) }
  has_many :products

  def subcategories
    Category.where(parent_id: id)
  end
end
