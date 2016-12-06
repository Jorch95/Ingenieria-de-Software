class PurchasesController < ApplicationController
	before_action :authenticate_user!

	def new
		@purchase = Purchase.new
	end

	def destroy
		Purchase.all.where(user_id: current_user.id).each do |pur|
			pur.update(baja_logica: true)
		end
		redirect_to action: "show"
	end

	def show
		@puntosTotales = current_user.puntaje
		@costoTotal = 0
		@puntosTotal = 0
		Purchase.all.where(user_id: current_user.id).where(baja_logica: false).each do |pur|
			@costoTotal = @costoTotal + pur.total
			@puntosTotal = @puntosTotal + pur.puntos
		end

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
		@purchases = Purchase.all.where(user_id: current_user.id).where(baja_logica: false).order(ordering)
	end

	def create
		@purchase = current_user.purchases.new purchase_params
		@purchase.update(total: @purchase.puntos*Purchase::PRECIO_POR_PUNTO)
		if @purchase.save
			current_user.update(puntaje: current_user.puntaje + @purchase.puntos)
			redirect_to action: "show"
		else
			render :new
		end
	end

	def analisis
			@compras = Purchase.all
	end

	private

	def purchase_params
		params.require(:purchase).permit(:puntos, :total)
	end
end
