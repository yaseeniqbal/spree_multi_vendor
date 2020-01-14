module Spree::Stock::PackageDecorator
  def shipping_methods
    shipping_categories.map(&:shipping_methods).reduce(:&).to_a
  end
end

Spree::Stock::Package.prepend Spree::Stock::PackageDecorator
