class AddFinalizadoColumnToFavours < ActiveRecord::Migration
  def change
    add_column :favours, :finalizado, :boolean, default: false
  end
end
