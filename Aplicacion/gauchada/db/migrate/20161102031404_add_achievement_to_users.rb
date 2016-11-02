class AddAchievementToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :achievement, index: true, foreign_key: true
  end
end
