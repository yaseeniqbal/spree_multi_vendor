class AddHomeCheckForVendor < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_vendors, :to_home,  :boolean, :default => false
  end
end
