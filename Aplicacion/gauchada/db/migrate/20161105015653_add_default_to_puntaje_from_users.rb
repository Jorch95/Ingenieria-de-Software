class AddDefaultToPuntajeFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :puntaje, :integer, :default => 0
  end
end
