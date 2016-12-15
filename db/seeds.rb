puts 'Creo algunos logros'
5.times do |i|
  Achievement.find_or_create_by!(titulo: "Logro #{i}", descripcion:"Descripcion lero lero uno dos tres probando",rango_inferior:0+5*i, rango_superior: -1+5*(i+1))
end
Achievement.find_or_create_by(titulo: "Yisus", descripcion:"Lo mejor de lo mejor",rango_inferior:1000, rango_superior: 9999)
Achievement.find_or_create_by(titulo: "Ricardo Fort", descripcion:"MAIAMEEEEEEEEEEE",rango_inferior:50, rango_superior:666)
Achievement.find_or_create_by(titulo: "A",descripcion: "Hola :)",rango_inferior: 700, rango_superior: 720)

puts 'Creo algunos usuarios'

nacim = DateTime.new(1990, 11, 02) # Estandar ISO 8601: YYYY, MM, DD
caduc = DateTime.new(2020, 6, 22)
users = []
4.times do |i|
  users[i] = User.create(nombre: "Lalo#{i}", apellido: "Mir#{i}", password:"password",password_confirmation: "password", telefono: "5345434444", puntaje: 10, pais: "Argentina", sexo: true, email: "lalo#{i}@gmail.com", fecha_nacimiento: nacim, admin: false, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: "4534305368198206", tc_pin: 4379, tc_caducidad: caduc)
end

 n = User.create(nombre: "nahuel", apellido: "ter", password:"123123123", password_confirmation: "123123123", telefono: "12345678910", puntaje: 10, pais: "Argentina", sexo: true, email: "unlp93nahuelter@gmail.com", fecha_nacimiento: nacim, admin: true, tc_apellido: "Mir",
    tc_nombre: "Lalo", tc_numero: "4534305368198206", tc_pin: 1234, tc_caducidad: caduc)

User.create(nombre: "Nancy", apellido: "Diaz", password:"123123123", password_confirmation: "123123123", telefono: "12345678910", puntaje: 10, pais: "Argentina", sexo: false, email: "gauchadaunlp@gmail.com", fecha_nacimiento: nacim, admin: true, tc_apellido: nil,
    tc_nombre: nil, tc_numero: nil, tc_pin: nil, tc_caducidad: nil)

puts 'Creo algunos compras ficticias'
  n.purchases.create(puntos: 2, total: 24)
  sleep 2 # Duermo 2 segundos
  n.purchases.create(puntos: 10, total: 120)
  n.update(puntaje: 12)
  users[0].purchases.create(puntos: 10, total: 120)
  users[0].update(puntaje: 10)

puts 'Creo algunos favores'
users[0].favours.find_or_create_by(titulo: "Ayuda 0", descripcion:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse fermentum justo vitae mi commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget dapibus dui, eu viverra mauris. Fusce quis justo mi. Donec viverra aliquet nisi. Phasellus auctor quam eget eros porta consectetur. Nullam vel efficitur erat. Quisque pulvinar eget arcu semper finibus. Suspendisse euismod massa vitae nisl dapibus condimentum. Sed ultricies turpis risus, quis tincidunt diam ullamcorper ut. Pellentesque pulvinar augue libero, quis iaculis leo commodo tempor. Phasellus eleifend convallis euismod. Ut urna ex, malesuada facilisis nibh in, imperdiet varius lorem.", ciudad: "Mendoza", provincia: "Mendoza", image_url: "http://gdurl.com/Tt5L" )
sleep 1
users[1].favours.find_or_create_by(titulo: "Ayuda 1", descripcion:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse fermentum justo vitae mi commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget dapibus dui, eu viverra mauris. Fusce quis justo mi. Donec viverra aliquet nisi. Phasellus auctor quam eget eros porta consectetur. Nullam vel efficitur erat. Quisque pulvinar eget arcu semper finibus. Suspendisse euismod massa vitae nisl dapibus condimentum. Sed ultricies turpis risus, quis tincidunt diam ullamcorper ut. Pellentesque pulvinar augue libero, quis iaculis leo commodo tempor. Phasellus eleifend convallis euismod. Ut urna ex, malesuada facilisis nibh in, imperdiet varius lorem.", ciudad: "Bariloche", provincia: "Rio Negro",image_url: "http://gdurl.com/GY5O")
sleep 1
users[2].favours.find_or_create_by(titulo: "Ayuda 2", descripcion:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse fermentum justo vitae mi commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget dapibus dui, eu viverra mauris. Fusce quis justo mi. Donec viverra aliquet nisi. Phasellus auctor quam eget eros porta consectetur. Nullam vel efficitur erat. Quisque pulvinar eget arcu semper finibus. Suspendisse euismod massa vitae nisl dapibus condimentum. Sed ultricies turpis risus, quis tincidunt diam ullamcorper ut. Pellentesque pulvinar augue libero, quis iaculis leo commodo tempor. Phasellus eleifend convallis euismod. Ut urna ex, malesuada facilisis nibh in, imperdiet varius lorem.", ciudad: "Buenos Aires", provincia: "Buenos Aires",image_url: "http://gdurl.com/GY5O")
sleep 1
users[3].favours.find_or_create_by(titulo: "Ayuda 3", descripcion:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse fermentum justo vitae mi commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget dapibus dui, eu viverra mauris. Fusce quis justo mi. Donec viverra aliquet nisi. Phasellus auctor quam eget eros porta consectetur. Nullam vel efficitur erat. Quisque pulvinar eget arcu semper finibus. Suspendisse euismod massa vitae nisl dapibus condimentum. Sed ultricies turpis risus, quis tincidunt diam ullamcorper ut. Pellentesque pulvinar augue libero, quis iaculis leo commodo tempor. Phasellus eleifend convallis euismod. Ut urna ex, malesuada facilisis nibh in, imperdiet varius lorem.", ciudad: "Olmos", provincia: "Buenos Aires", image_url: "http://gdurl.com/avof" )
sleep 1
users[0].favours.find_or_create_by(titulo: "Busco acompañante de viaje", descripcion:"Soy camionero y busco una persona que me acompañe e mi viaje hasta Rawson porque sufro problemas de sueño.\n Saldriamos el primer fin de semana de octubre y retornariamos el fin de semana siguiente. \n Condición fundamental: debe cebar buenos mates.", ciudad: "Rosario", provincia: "Rosario",image_url: "http://gdurl.com/GY5O")
users[0].favours.find_or_create_by(titulo: "Reencontrarme con Ramirez", descripcion:"Ramirez es un burrito que tenia de mascota en un campo de Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. \nMe gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.\n*La foto es del 2004, Ramirez puede haber cambiado un poco.", ciudad: "Tierra del Fuego", provincia: "Tierra del Fuego", image_url: "http://gdurl.com/dQOd" )
sleep 1
users[3].favours.find_or_create_by(titulo: "Busco testigo falso", descripcion:"El año pasado tuve un accidente automovilistico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.\nNecesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa para esquivarlo/a.", ciudad: "La Pampa", provincia: "La Pampa",image_url: "http://gdurl.com/GY5O")
users[2].favours.find_or_create_by(titulo: "Restaurar obra de arte", descripcion:"La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?.", ciudad: "San Luis", provincia: "San Luis", image_url: "http://gdurl.com/pIsx")
sleep 1
users[1].favours.find_or_create_by(titulo: "Karl", descripcion:"Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones.\nEs muy juguetón y muy buena compañía.", ciudad: "Buenos Aires", provincia: "Buenos Aires", image_url: "http://gdurl.com/kDoTg" )
users[1].favours.find_or_create_by(titulo: "Necesito que alguien me pase a buscar", descripcion:"Durante una misión en Marte, una fuerte tormenta de polvo nos obligó a proceder la evacuación del planeta. En la confusion de la tormeta, mi equipo me dió por muerto, por lo que tomaron la decisión de irse sin mi.\nLogré sobrevivir desde entonces con los pocos recursos en el planeta.\n Llegue a improvisar un campo de cultivos con los excrementos almacenados de toda la tripulación. Menos el de Ramirez, le encantaban los porotos.\nSi alguno se encuentra de paso por Marte, me vendria bien un aventón.", ciudad: "Paradero desconocido", provincia: "-", image_url: "http://gdurl.com/hzSD" )
