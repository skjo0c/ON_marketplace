class AddMobileAddressToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :mobile, :string
    add_column :orders, :address, :string
  end
end
