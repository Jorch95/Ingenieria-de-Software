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
User.find_or_create_by(nombre: "Lalo", apellido: "Mir", telefono: 5236521563, puntaje: 5, pais: "Argentina", sexo: true, email: "lalo@gmail.com", fecha_nacimiento: nacim, admin: false, tc_apellido: "Mir", tc_nombre: "Lalo", tc_numero: 4409553306027449, tc_pin: 43793400, tc_caducidad: caduc)
User.find_or_create_by(nombre: "Arandano", apellido: "Mora", telefono: 5236521563, puntaje: 5, pais: "Argentina", sexo: true, email: "anrandano@gmail.com", fecha_nacimiento: nacim, admin: false, tc_apellido: "Mir", tc_nombre: "Lalo", tc_numero: 4409553306027449, tc_pin: 43793400, tc_caducidad: caduc)

