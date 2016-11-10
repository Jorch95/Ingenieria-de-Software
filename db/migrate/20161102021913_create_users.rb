class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.integer :telefono
      t.integer :puntaje
      t.string :pais
      t.boolean :sexo
      t.string :email
      t.date :fechaNacimiento
      t.boolean :admin
      t.string :tc_apellido
      t.string :tc_nombre
      t.integer :tc_numero
      t.integer :tc_pin
      t.date :tc_caducidad

      t.timestamps null: false
    end
  end
end
