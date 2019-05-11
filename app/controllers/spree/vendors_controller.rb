module Spree
  class VendorsController < Spree::StoreController
    before_action :set_spree_vendor, only: [:show]

    def index
      if params[:keywords].present?
        params[:q] = {name_cont: params[:keywords]}
        @q = Spree::Vendor.ransack(params[:q])
        @stores = @q.result(distinct: true).approved
      else
        @stores = Spree::Vendor.approved
      end
    end

    def show

    end

    private
      def set_spree_vendor
        @store = Spree::Vendor.friendly.find(params[:id])
      end
  end
end