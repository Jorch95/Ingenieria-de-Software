class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :fecha
      t.integer :puntos

      t.timestamps null: false
    end
  end
end
