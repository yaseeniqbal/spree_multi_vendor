class AddSelfReffToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_orders, :parent_id, :integer,index: true
  end
end
