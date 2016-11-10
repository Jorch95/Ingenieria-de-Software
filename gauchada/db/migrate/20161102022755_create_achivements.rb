class CreateAchivements < ActiveRecord::Migration
  def change
    create_table :achivements do |t|
      t.integer :rango_inferior
      t.integer :rango_superior
      t.text :descripcion
      t.string :titulo

      t.timestamps null: false
    end
  end
end
