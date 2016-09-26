class AddVendorIdToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :vendor_id, :integer
  end
end
