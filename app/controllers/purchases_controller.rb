class PurchasesController < ApplicationController
	before_action :authenticate_user!

	def new
		@userApellido = current_user.tc_apellido
		@userNombre = current_user.tc_nombre
		@userNumero = current_user.tc_numero
		@userPin = current_user.tc_pin
		@userCadu = current_user.tc_caducidad
		@total = Purchase::PRECIO_POR_PUNTO*2
		@purchase = Purchase.new
	end

	def create
		@purchase = Purchase.new purchase_params
	end

	def show
		# para que en la vista solo actualice el icono del campo correspondiente se le agrega al sentido el -c para el create_at, el -t para el total y asi siguiendo.
		order = params[:sort] || "created_at"
		@sentido = params[:sentido] || "desc-c"
		if order == "puntos"
			if (@sentido == "asc-p")
				ordering = { puntos: :asc }
			else
				ordering = { puntos: :desc }
			end
		elsif order == "total"
			if (@sentido == "asc-t")
				ordering = { puntos: :asc }
			else
				ordering = { puntos: :desc }
			end
		elsif order == "created_at"
			if (@sentido == "asc-c")
				ordering = { created_at: :asc }
			else
				ordering = { created_at: :desc }
			end
		end
    	@purchases = Purchase.all.where(user_id: current_user.id).order(ordering)
	end
	
	private
	
	def purchase_params
		params.require(:purchase).permit(:puntos)
	end
end
