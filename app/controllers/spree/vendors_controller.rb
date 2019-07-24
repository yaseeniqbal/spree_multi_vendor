module Spree
  class VendorsController < Spree::StoreController
    before_action :set_spree_vendor, only: [:show]

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @stores = @searcher.retrieve_vendors
      if params[:keywords].present?
        params[:q] = {name_cont: params[:keywords]}
                         # .page(curr_page).per(per_page)
        @q = @stores.ransack(params[:q])
        @stores = @q.result(distinct: true)
      # else
      #   @stores = Spree::Vendor.approved
      end
      respond_to do |format|
        format.js
        format.html
      end
    end

    def show
      @store_products = @store.products.in_stock.approved
    end
    def get_store_products
      store = Spree::Vendor.friendly.find(params[:id])
      @searcher = build_searcher(params.merge(include_images: true))
      if @searcher.properties
        per_page = @searcher.properties[:per_page]
        page = @searcher.properties[:page]
        curr_page = page || 1
        @products = store.products.page(curr_page).per(per_page).approved.in_stock.distinct
      else
        @products = store.products.approved.in_stock.distinct
      end
      @title = store.name
      if params[:store_slug].present?
        @store_slug = params[:store_slug]
      end
    end

    private
      def set_spree_vendor
        @store = Spree::Vendor.friendly.find(params[:id])
      end
  end
end