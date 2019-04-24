class AddMultiAddressMultiGoogleUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :address2,  :string
    add_column :spree_vendors, :address3,  :string
    add_column :spree_vendors, :address4,  :string
    add_column :spree_vendors, :google_address2_url,  :string
    add_column :spree_vendors, :google_address3_url,  :string
    add_column :spree_vendors, :google_address4_url,  :string
  end
end
