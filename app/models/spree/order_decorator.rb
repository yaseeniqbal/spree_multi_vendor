Spree::Order.class_eval do
  belongs_to :vendor
  has_many :sub_orders, foreign_key: "parent_order_id", class_name: "Spree::Order"
  belongs_to :parent_order, foreign_key: "parent_order_id", class_name: "Spree::Order"

  state_machine.after_transition to: :complete, do: :split_with_splitter!

  def clone
    self.class.new(attributes.except('id', 'number', 'updated_at', 'created_at'))
  end

  def split_with_splitter!
    Spree::OrderSplitter.new(self).split!
  end
end
