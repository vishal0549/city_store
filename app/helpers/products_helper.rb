# frozen_string_literal: true

module ProductsHelper
  def homepage_images
    Dir.children(Rails.root + 'app/assets/images/front').reverse - ['.DS_Store']
  end

  def indian_rupee(value)
    format('%s%.2f', "\u20B9", value)
  end

  def category_tree(category_id)
    category = Category.find(category_id)
    cat_tree = [[category.name, category_path(category), 'active']]
    if category.parent
      cat_tree << [category.parent.name, category_path(category.parent)]
      cat_tree << [category.parent.parent.name, category_path(category.parent.parent)] if category.parent.parent
    end
    cat_tree.reverse.map { |name,url| link_to(name, url, data: { turbolinks: false }) }.join(" <i class='arrow right icon small'></i> ").html_safe
  end

  def category_product_units(_category)
    @category_product_units ||= []
  end

  def image_file(object)
    if object.avatar.attached?
      image_tag(url_for(object.avatar))
    else
      image_tag('placeholder.jpg')
    end
  end
end
