class AddFavourToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :favour, index: true, foreign_key: true
  end
end
