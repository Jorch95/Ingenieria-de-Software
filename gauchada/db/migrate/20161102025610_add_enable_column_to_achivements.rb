class AddEnableColumnToAchivements < ActiveRecord::Migration
  def change
    add_column :achivements, :enable, :boolean, default: true
  end
end
