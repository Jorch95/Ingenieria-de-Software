class AddTotalColumnToPurchases < ActiveRecord::Migration
  def change
  	add_column :purchases, :total, :integer
  end
end
