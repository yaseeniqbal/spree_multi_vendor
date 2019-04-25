class AddStandardStatusInProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :standard_status, :integer
  end
end
