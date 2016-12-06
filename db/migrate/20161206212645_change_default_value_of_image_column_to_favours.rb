class ChangeDefaultValueOfImageColumnToFavours < ActiveRecord::Migration
  def change
  	 change_column :favours, :image_url, :string
  end
end
