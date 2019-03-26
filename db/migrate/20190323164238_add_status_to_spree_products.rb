class AddStatusToSpreeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :status, :integer
  end
end
