class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :achievement
	has_many :purchases
	has_many :favours
	has_many :requests


	validates :terminos_legales, acceptance: true
	# :sexo, :pais
	validates_presence_of :email, :nombre, :apellido, :fecha_nacimiento,:telefono
	validates :password, :password_confirmation, presence: true, length: {minimum: 7, maximum: 30}, on: :create
 	validates :password, :password_confirmation, length: {minimum: 7, maximum: 30}, on: :update, allow_blank: true
 
	validates :tc_pin, :allow_nil => true, length: { minimum: 4, maximum: 4 }
	validate :permitir_tc_numero
	def permitir_tc_numero
		unless self.tc_numero.nil? || self.tc_numero == "" || self.tc_numero.length == 16
			errors.add :tc_numero, 'Solamente numeros con 16 cifras'
		end
	end
	# validates_format_of :tc_numero, :allow_nil => true, :with =>  /\d[0-9]\)*\z/ , :message => "Solamente numeros"
	# validates :tc_numero, :allow_nil => true, length: { minimum: 16, maximum: 16 }
	
	validates :tc_caducidad,
				date: { after: Proc.new { Time.now + 1.day }, message: 'Debe caducar como muy pronto mañana' }, on: :create, :allow_nil => true

	validates :email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})\z/, message: ": caracteres permitidos: a-z, A-Z, 0-9, guiones, punto (.)" }
	validates_format_of :telefono, :with =>  /\d[0-9]\)*\z/ , :message => "Solamente numeros sin espacios"
	
	validates :fecha_nacimiento,
				date: { before: Proc.new { Time.now - 18.year }, message: 'Debes ser mayor de 18 años.' }, on: :create


	##Se sobreescribe el save para que se mantenga la clasificacion actualizada de los logros
	before_save :achievement_check
	def achievement_check
		#buscar en que rango pertenece
		Achievement.where(enable: true).each do |a|
			if self.puntaje>=a.rango_inferior && self.puntaje<=a.rango_superior
				self.achievement=a
				return
			end
			self.achievement=nil
		end
	end


end
