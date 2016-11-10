class ChangeColumnFechaNFromUsers < ActiveRecord::Migration
  def change
    rename_column :users, :fechaNacimiento, :fecha_nacimiento
  end
end
