class AddAdditionalFieldsToVendors < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_vendors, :t_distance, :string
  	add_column :spree_vendors, :address, :string
  	add_column :spree_vendors, :lat, :float
  	add_column :spree_vendors, :lng, :float
  	add_column :spree_vendors, :is_appointable, :boolean, default: true
  end
end

