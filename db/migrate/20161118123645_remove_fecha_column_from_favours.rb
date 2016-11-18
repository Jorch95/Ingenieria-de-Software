class RemoveFechaColumnFromFavours < ActiveRecord::Migration
  def change
    remove_column :favours, :fecha
  end
end
