class DeleteFechaColumnToPurchases < ActiveRecord::Migration
  def change
  	remove_column :purchases, :fecha, :date
  end
end
