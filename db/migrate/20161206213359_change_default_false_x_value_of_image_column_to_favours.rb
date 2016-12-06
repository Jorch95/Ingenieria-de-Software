class ChangeDefaultFalseXValueOfImageColumnToFavours < ActiveRecord::Migration
  def change
  	change_column_default(:favours, :image_url, nil)
  end
end
