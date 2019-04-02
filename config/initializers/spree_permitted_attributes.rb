module Spree
  module PermittedAttributes
    ATTRIBUTES << :vendor_attributes

    mattr_reader *ATTRIBUTES

    @@vendor_attributes = [:name, :about_us, :contact_us,:t_distance,:address,:lat,:lng,:is_appointable,:logo_image]
  end
end
