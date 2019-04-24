Spree::Product.class_eval do
  self.whitelisted_ransackable_attributes += %w[status]
  self.whitelisted_ransackable_associations += %w[vendor]

  enum status: [ :draft, :approved ]
  ransacker :status, formatter: proc {|v| statuses[v]}

end
