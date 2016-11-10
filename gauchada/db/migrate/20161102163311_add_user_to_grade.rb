class AddUserToGrade < ActiveRecord::Migration
  def change
    add_reference :grades, :user, index: true, foreign_key: true
  end
end
