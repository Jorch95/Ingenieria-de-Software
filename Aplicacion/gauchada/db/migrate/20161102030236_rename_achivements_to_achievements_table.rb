class RenameAchivementsToAchievementsTable < ActiveRecord::Migration
  def change
    rename_table :achivements, :achievements
  end
end
