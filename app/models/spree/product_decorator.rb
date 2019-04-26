Spree::Product.class_eval do
  self.whitelisted_ransackable_attributes += %w[status]
  self.whitelisted_ransackable_associations += %w[vendor]

  enum status: [ :draft, :approved ]
  enum standard_status: [ :exclusive ]
  ransacker :status, formatter: proc {|v| statuses[v]}


  scope :in_stock, ->{joins(:master => :prices, variants_including_master: :stock_items).where("spree_stock_items.count_on_hand >? AND spree_products.available_on <?",0,Time.now)}
end