# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creo algunos usuarios'

nacim = DateTime.new(1990, 11, 02) # Estandar ISO 8601: YYYY, MM, DD
caduc = DateTime.new(1990, 6, 22)
users = []
4.times do |i|
  users[i] = User.create(nombre: "Lalo#{i}", apellido: "Mir#{i}", password:"password",password_confirmation: "password", telefono: "5345434444", puntaje: 5, pais: "Argentina", sexo: true, email: "lalo#{i}@gmail.com", fecha_nacimiento: nacim, admin: false, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: 45434534, tc_pin: 43793400, tc_caducidad: caduc)
end

User.create(nombre: "nahuel", apellido: "ter", password:"123123123", password_confirmation: "123123123", telefono: "12345678910", puntaje: 5, pais: "Argentina", sexo: true, email: "unlp93nahuelter@gmail.com", fecha_nacimiento: nacim, admin: true, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: 45434534, tc_pin: 43793400, tc_caducidad: caduc)

puts 'Creo algunos favores'

  users[0].favours.create(titulo: "Ayuda 0", descripcion:" Descripcion 0", ciudad: "Alguna 0", fecha: DateTime.new(2016,11,04), image_url: "http://gdurl.com/Tt5L" )
  users[1].favours.create(titulo: "Ayuda 1", descripcion:" Descripcion 1", ciudad: "Alguna 1", fecha: DateTime.new(2016,11,04), image_url: "http://gdurl.com/kt6L" )
  users[2].favours.create(titulo: "Ayuda 2", descripcion:" Descripcion 2", ciudad: "Alguna 2", fecha: DateTime.new(2016,11,04), image_url: "http://gdurl.com/e_E4" )
  users[3].favours.create(titulo: "Ayuda 3", descripcion:" Descripcion 3", ciudad: "Alguna 3", fecha: DateTime.new(2016,11,04), image_url: "http://gdurl.com/avof" )
  #puts users[f].valid?
  #users[f].errors.full_messages.each do |msg|
  #  puts msg
  #send

puts 'Creo algunos logros'
5.times do |i|
  Achievement.find_or_create_by(titulo: "Logro #{i}", descripcion:"Descripcion lero lero uno dos tres probando",rango_inferior:0+5*i, rango_superior: -1+5*(i+1))
end
Achievement.find_or_create_by(titulo: "Yisus", descripcion:"Lo mejor de lo mejor",rango_inferior:1000, rango_superior: 9999999)
Achievement.find_or_create_by(titulo: "Ricardo Fort", descripcion:"MAIAMEEEEEEEEEEE",rango_inferior:50, rango_superior:666)
