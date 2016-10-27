class AddAddressToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :address, :text
  end
end
