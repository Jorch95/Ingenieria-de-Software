class AddDefaultToImageUrlFromFavours < ActiveRecord::Migration
  def change
  	change_column :favours, :image_url, :string, :default => "http://gdurl.com/GY5O"
  end
end
