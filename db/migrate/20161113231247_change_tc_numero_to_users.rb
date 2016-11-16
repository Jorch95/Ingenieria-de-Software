class ChangeTcNumeroToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :tc_numero, :string
  end
end
