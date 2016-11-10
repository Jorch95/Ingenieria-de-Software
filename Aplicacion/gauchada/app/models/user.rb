class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_one :achievement
	has_many :purchases
	has_many :favours
	has_many :requests


	validates :terminos_legales, acceptance: true
	# :sexo, :pais
	validates_presence_of :email, :password, :password_confirmation, :nombre, :apellido, :fecha_nacimiento,:telefono
	validates :password, :password_confirmation, length: { minimum: 7 }
	validates :email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})\z/, message: ": caracteres permitidos: a-z, A-Z, 0-9, guiones, punto (.)" } 
	validates_format_of :telefono, :with =>  /\d[0-9]\)*\z/ , :message => "Solamente numeros sin espacios"
	validates :fecha_nacimiento,
				date: { before: Proc.new { Time.now - 18.year }, message: 'Debes ser mayor de 18 años.' },
  on: :create

end