module Spree
  module PermittedAttributes
    ATTRIBUTES << :vendor_attributes

    mattr_reader *ATTRIBUTES

    @@vendor_attributes = [:name, :about_us, :contact_us,:t_distance,:address,:lat,:lng,:is_appointable,:logo_image,
                           :email, :speciality, :google_address_url, :opn_hrs, :mon_hrs, :tue_hrs, :wed_hrs, :thu_hrs, 
                           :fri_hrs, :sat_hrs, :sun_hrs, :pub_holiday_hrs, :fb_lnk, :pintrest_lnk, :twitter_lnk, :whatsapp_lnk]
  end
end
