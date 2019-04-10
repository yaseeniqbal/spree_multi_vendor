class AddRemaningFieldsToVendor < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_vendors, :email, :string
	add_column :spree_vendors, :speciality, :string
	add_column :spree_vendors, :google_address_url, :string
	add_column :spree_vendors, :opn_hrs, :string
	add_column :spree_vendors, :mon_hrs, :string
	add_column :spree_vendors, :tue_hrs, :string
	add_column :spree_vendors, :wed_hrs, :string
	add_column :spree_vendors, :thu_hrs, :string
	add_column :spree_vendors, :fri_hrs, :string
	add_column :spree_vendors, :sat_hrs, :string
	add_column :spree_vendors, :sun_hrs, :string
	add_column :spree_vendors, :pub_holiday_hrs, :string
	add_column :spree_vendors, :fb_lnk, :string
	add_column :spree_vendors, :pintrest_lnk, :string
	add_column :spree_vendors, :twitter_lnk, :string
	add_column :spree_vendors, :whatsapp_lnk, :string
  end
end



