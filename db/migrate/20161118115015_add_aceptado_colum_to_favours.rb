class AddAceptadoColumToFavours < ActiveRecord::Migration
  def change
    add_column :favours, :aceptado, :boolean, default: false;
  end
end
