class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
	belongs_to :achievement
	has_many :purchases
	has_many :favours, dependent: :destroy
	has_many :requests, dependent: :destroy
	has_many :comments
	has_many :notifications, dependent: :destroy
	has_many :grades

	validates :terminos_legales, acceptance: true
	# :sexo, :pais
	validates_presence_of :email, :nombre, :apellido, :fecha_nacimiento,:telefono
	validates :password, :password_confirmation, presence: true, length: {minimum: 7, maximum: 30}, on: :create
	validates :password, :password_confirmation, length: {minimum: 7, maximum: 30}, on: :update, allow_blank: true

	validates :tc_pin, :allow_nil => true, length: { minimum: 4, maximum: 4 }

	validate :tarjeta_nom_ap_num

	def ranking
		@users = User.all.order(:puntaje)
	end
	def tarjeta_nom_ap_num
		if self.tc_numero == "" || self.tc_nombre == "" || self.tc_apellido == ""
			errors.add "Los Campos numero, nombre y apellido ", 'no deben estar vacios.'
		end
	end

	validate :permitir_tc_numero
	def permitir_tc_numero
		unless self.tc_numero.nil? || self.tc_numero == '4534305368198206' || self.tc_numero == "4865547196808063" || self.tc_numero == "4223131175950282"
			unless self.tc_numero.length == 16
				errors.add "El numero de la tarjeta ", 'debe ser un numero de 16 cifras.'
			end
			errors.add "El numero de la tarjeta ", 'debe estar validado por el banco.'
		end
	end

	validate :limite_caducidad_al_crear
	def limite_caducidad_al_crear
		unless self.tc_caducidad.nil?
			if self.tc_caducidad <= Time.now
				errors.add "La fecha caducidad de la tarjeta ", 'debe caducar como muy pronto mañana.'
			end
		end
	end

	validate :limite_caducidad_al_actualizar, on: :save_card
	def limite_caducidad_al_actualizar
		if self.tc_caducidad.nil?
			errors.add "La fecha caducidad de la tarjeta ", 'no debe ser vacio.'
		end
	end
	validates :email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})\z/, message: ": caracteres permitidos: a-z, A-Z, 0-9, guiones, punto (.)" }
	validates_format_of :telefono, :with =>  /\d[0-9]\)*\z/ , :message => "Solamente numeros sin espacios"

	validate :limite_edad
	def limite_edad
		if self.fecha_nacimiento >= Time.now - 18.year
			errors.add "Tu fecha de nacimiento ", 'debes ser mayor de 18 años.'
		end
	end

	##Se sobreescribe el save para que se mantenga la clasificacion actualizada de los logros
	before_save :achievement_check
	def achievement_check
		#buscar en que rango pertenece
		Achievement.where(enable: true).each do |a|
			if self.puntaje>=a.rango_inferior && self.puntaje<=a.rango_superior
				self.achievement=a
				return
			end
		end
		self.achievement=nil
	end

	before_destroy :update_card
	def update_card
		self.purchases.update_all(user_id: nil)
	end
end
