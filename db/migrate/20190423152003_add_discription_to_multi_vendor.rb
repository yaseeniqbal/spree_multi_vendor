class AddDiscriptionToMultiVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :description,  :text
  end
end
