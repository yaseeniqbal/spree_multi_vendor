Spree::Order.class_eval do
	has_many :sub_orders, class_name: "Spree::Order",foreign_key: "parent_id", dependent: :destroy
	belongs_to :parent, class_name: "Spree::Order",foreign_key: "parent_id"

	# before_save :create_sub_orders

	def create_sub_orders

		if (self.state == "complete") && (self.parent.blank?)

			o_line_items = self.line_items.includes(product: :vendor)
			vendors_in_order = o_line_items.map{|s|s.product.vendor}

			vendors_in_order.each do |ven|

				v_line_items = o_line_items.select{|s|s.product.vendor == ven}
				duped_order = self.dup
				sub_order   = self.sub_orders.new
				o   = sub_order = duped_order
				o.line_items << v_line_items
				o.parent = self
				o.number = nil
				o.state = "complete"
				o.save!
				
			end

		end
	end
end