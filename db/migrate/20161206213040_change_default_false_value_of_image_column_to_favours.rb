class ChangeDefaultFalseValueOfImageColumnToFavours < ActiveRecord::Migration
  def change
  	  	 change_column :favours, :image_url, :string, :default=>false

  end
end
