class AddEmailToVendors < ActiveRecord::Migration[5.0]
  def change
  	add_column :vendors, :email, :string
  	add_column :vendors, :website, :string
  end
end
