class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 7..128
	has_one :achievement
	has_many :purchases
	has_many :favours
	has_many :requests

	# :sexo, :pais
	validates_presence_of :email, :password, :password_confirmation, :nombre, :apellido, :fecha_nacimiento,:telefono
	validates :telefono, numericality: { only_integer:true }
	validates :password, :password_confirmation, length: { minimum: 7 }
	validates :email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})\z/, message: ": caracteres permitidos: a-z, A-Z, 0-9, guiones, punto (.)" } 
	validate :edad_permitida?
	def edad_permitida?
		if self.fecha_nacimiento.present? and self.fecha_nacimiento > 18.years.ago
			{message: "Debes ser mayor de 18 años"}
			# errors.add(:edad, 'Debes ser mayor de 18 años')
		end
	end
end
