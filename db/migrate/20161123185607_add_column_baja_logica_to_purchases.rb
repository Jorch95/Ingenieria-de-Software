class AddColumnBajaLogicaToPurchases < ActiveRecord::Migration
  def change
  	add_column :purchases, :baja_logica, :boolean, default: false;
  end
end
