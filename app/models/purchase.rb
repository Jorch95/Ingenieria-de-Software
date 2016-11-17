class Purchase < ActiveRecord::Base
	belongs_to :user

	PRECIO_POR_PUNTO=12

	validates_presence_of :puntos, :total
	validates_numericality_of :puntos, :greater_than_or_equal_to => 1, :message => " debe ser un numero mayor a 1"

	validate :validacion_tarjeta, :on => :create

	private
    def validacion_tarjeta
		if user.tc_apellido.blank? || user.tc_nombre.blank? || user.tc_numero.blank? || user.tc_pin.blank? || user.tc_caducidad.nil?
			errors.add(:purchase, 'Tarjeta invalida')
		end
	end
end
