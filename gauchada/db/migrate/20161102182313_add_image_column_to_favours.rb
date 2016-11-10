class AddImageColumnToFavours < ActiveRecord::Migration
  def change
    add_column :favours, :image_url, :string
  end
end
