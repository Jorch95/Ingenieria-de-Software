class AddUserToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :user, index: true, foreign_key: true
  end
end
