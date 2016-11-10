class AddFavourToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :favour, index: true, foreign_key: true
  end
end
