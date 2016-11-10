class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :aceptacion
      t.text :descripcion
      t.date :fecha

      t.timestamps null: false
    end
  end
end
