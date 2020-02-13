module Spree
  module Admin
    class VendorsController < ResourceController
       def create
        if permitted_resource_params[:image] && Spree.version.to_f >= 3.6
          @vendor.build_image(attachment: permitted_resource_params.delete(:image))
        end
        super
        # if @vendor.save
        #   flash[:notice] = "Vendor successfully created"
        #   respond_to do |format|
        #     format.js
        #   end
        # else
        #   if @vendor.image.blank? && @vendor.title.present?
        #     respond_to do |format|
        #     format.js
        #     end
        #   else
        #     respond_to do |format|
        #       format.js
        #       format.html { redirect_to spree.admin_vendors_url }
        #     end
        #   end
        # end
      end

      def update
        if permitted_resource_params[:image] && Spree.version.to_f >= 3.6
          @vendor.create_image(attachment: permitted_resource_params.delete(:image))
        end
        super
        # if @vendor.save
        #   flash[:notice] = "Vendor successfully updated"
        #   respond_to do |format|
        #     format.js   
        #     format.html { redirect_to spree.admin_vendors_path }
        #   end
        # else
        #   respond_to do |format|
        #     format.js
        #     format.html { redirect_to spree.admin_vendors_url }
        #   end
        # end
      end

      def update_positions
        params[:positions].each do |id, position|
          vendor = Spree::Vendor.find(id)
          vendor.set_list_position(position)
        end

        respond_to do |format|
          format.js { render plain: 'Ok' }
        end
      end

      private

      def find_resource
        Vendor.with_deleted.friendly.find(params[:id])
      end

      def collection
        params[:q] = {} if params[:q].blank?
        vendors = super.order(priority: :asc)
        @search = vendors.ransack(params[:q])

        @collection = @search.result.
                      page(params[:page]).
                      per(params[:per_page])
      end
    end
  end
end
