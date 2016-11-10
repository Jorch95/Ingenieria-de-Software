class CreateFavours < ActiveRecord::Migration
  def change
    create_table :favours do |t|
      t.text :descripcion
      t.string :titulo
      t.string :ciudad
      t.string :provincia
      t.date :fecha

      t.timestamps null: false
    end
  end
end
