class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.text :descripcion
      t.boolean :calificacion

      t.timestamps null: false
    end
  end
end
