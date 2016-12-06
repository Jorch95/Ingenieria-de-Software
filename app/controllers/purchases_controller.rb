class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :fecha_correcta

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
			comprasAux = Purchase.all
			if params[:fecha_inicial].present? && params[:fecha_final].present?
				#comprasAux = comprasAux.where(:created_at => params[:fecha_inicial]...params[:fecha_final])
				comprasAux = comprasAux.where("created_at BETWEEN '#{Date.parse(params[:fecha_inicial]).beginning_of_day}' AND '#{Date.parse(params[:fecha_final]).end_of_day}'")
				@compras = comprasAux.group_by_day(:created_at).count
			else 
				@compras = comprasAux.group_by_day(:created_at).count
			end
			gananciaAux = 0 
			comprasAux.each do |c|
				gananciaAux += c.total
			end
			@ganancia = gananciaAux			
	end

	private

	def fecha_correcta
		if params[:fecha_inicial].present? && params[:fecha_final].present?
			if params[:fecha_inicial] > Time.now || params[:fecha_final] > Time.now
				flash[:alert] = 'Las fechas deben ser anterior al actual'
			end
			if params[:fecha_inicial] > params[:fecha_final]
				flash[:alert] = 'Fecha inicial debe ser menor que fecha final'
			end
		end
	end

	def purchase_params
		params.require(:purchase).permit(:puntos, :total)
	end
end
