module Spree
  class VendorsController < Spree::StoreController
    before_action :set_spree_vendor, only: [:show]

    def index
      @stores = Spree::Vendor.approved
    end

    def show

    end

    private
      def set_spree_vendor
        @store = Spree::Vendor.friendly.find(params[:id])
      end
  end
end