class AddSubTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :sub_total, :decimal
  end
end
