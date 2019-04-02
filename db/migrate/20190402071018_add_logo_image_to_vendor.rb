class AddLogoImageToVendor < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_vendors, :logo_image, :string
  end
end
