class RemoveVendorIdFromCategories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categories, :vendor_id, :integer
  end
end
