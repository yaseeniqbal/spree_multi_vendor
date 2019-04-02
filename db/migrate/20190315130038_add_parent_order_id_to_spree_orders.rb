class AddParentOrderIdToSpreeOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :parent_order_id, :bigint
	add_reference :spree_orders, :parent_order_id, index: true
  end
end
