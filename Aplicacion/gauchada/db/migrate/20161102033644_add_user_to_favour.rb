class AddUserToFavour < ActiveRecord::Migration
  def change
    add_reference :favours, :user, index: true, foreign_key: true
  end
end
