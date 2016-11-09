class ChangeTelefonoToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :telefono, :string
  end
end
