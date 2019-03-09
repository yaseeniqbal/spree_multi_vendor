module Spree
  class VendorsController < Spree::StoreController
    before_action :set_spree_vendor, only: [:show]

    def index
      @stores = Spree::Vendor.all
    end

    def show
    end

    private
      def set_spree_vendor
        @store = Spree::Vendor.find(params[:id])
      end
  end
end