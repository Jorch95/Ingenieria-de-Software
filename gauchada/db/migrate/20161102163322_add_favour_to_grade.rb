class AddFavourToGrade < ActiveRecord::Migration
  def change
    add_reference :grades, :favour, index: true, foreign_key: true
  end
end
