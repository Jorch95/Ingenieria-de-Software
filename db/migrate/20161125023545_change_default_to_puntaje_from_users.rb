class ChangeDefaultToPuntajeFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :puntaje, :integer, :default => 1
  end
end
