class SendMailer < ApplicationMailer
  default from: 'gauchadaunlp@gmail.com'

  def contact(email,nombre, mensaje)
  	@email = email
  	@nombre = nombre
  	@mensaje = mensaje
    mail(to: "gauchadaunlp@gmail.com", subject: "Mensaje para contacto de #{@nombre}")
  end
end