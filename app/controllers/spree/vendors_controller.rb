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
      @store_products = @store.products.in_stock.approved
    end
    def get_store_products
      @products = Spree::Vendor.friendly.find(params[:id]).products.approved.in_stock
      @title = params[:id]
    end

    private
      def set_spree_vendor
        @store = Spree::Vendor.friendly.find(params[:id])
      end
  end
end