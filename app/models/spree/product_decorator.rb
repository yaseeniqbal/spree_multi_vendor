Spree::Product.class_eval do
  self.whitelisted_ransackable_associations += %w[vendor]
  self.whitelisted_ransackable_attributes += %w[status]

  enum status: [ :archived, :approved ]
  ransacker :status, formatter: proc {|v| statuses[v]}

  default_scope { approved } 

end
