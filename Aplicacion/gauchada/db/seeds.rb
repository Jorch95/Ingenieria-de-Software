# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creo algunos usuarios'

nacim = DateTime.new(2016, 11, 02) # Estandar ISO 8601: YYYY, MM, DD
caduc = DateTime.new(2018, 6, 22)
users = []
4.times do |i|
  users[i] = User.create(nombre: "Lalo#{i}", apellido: "Mir#{i}", password:"password",password_confirmation: "password", telefono: 534543, puntaje: 5, pais: "Argentina", sexo: true, email: "lalo#{i}@gmail.com", fecha_nacimiento: nacim, admin: false, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: 45434534, tc_pin: 43793400, tc_caducidad: caduc)
end

User.create(nombre: "nahuel", apellido: "ter", password:"123123123", password_confirmation: "123123123", telefono: 53345431, puntaje: 5, pais: "Argentina", sexo: true, email: "unlp93nahuelter@gmail.com", fecha_nacimiento: nacim, admin: true, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: 45434534, tc_pin: 43793400, tc_caducidad: caduc)

4.times do |f|
  users[f].favours.create(titulo: "Ayuda #{f}", descripcion:" Descripcion #{f}", ciudad: "Alguna #{f}", fecha: DateTime.new(2016,11,04), image_url: "perro#{f}.jpg" )
  #puts users[f].valid?
  #users[f].errors.full_messages.each do |msg|
  #  puts msg
  #send
end
