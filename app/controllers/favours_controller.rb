class FavoursController < ApplicationController
  def index
      @favours = inicializar_favor
  end
  def show
      @favour = Favour.find(params[:id])
  end
  def edit
      @favour = Favour.find(params[:id])
      if current_user != @favour.user
        flash[:notice] = "No podes editar este favor"
        redirect_to action: "index"
      end
  end


  def inicializar_favor 
    if params[:filtrado_por].present? 
        criterio = params[:criterio]

        if params[:filtrado_por] == "Fecha decreciente"
          return Favour.all.descendente()
        elsif params[:filtrado_por] == "Fecha creciente"
          return Favour.all.ascendente()
        end

        if criterio == ""
          return Favour.all
        elsif params[:filtrado_por] == "Descripcion"
          #return Favour.descripcion(criterio)
          #return Favour.includes(:resources).where("resources.resource_type_id = ?", @resource_type.id)
          #return Favour.includes(:criterio).where("descripcion = ?", criterio)
        elsif params[:filtrado_por] == "Titulo"
          return Favour.titulo(criterio)
        elsif params[:filtrado_por] == "Ciudad"
          return Favour.ciudad(criterio)
        elsif params[:filtrado_por] == "Provincia"
          return Favour.provincia(criterio)
        end
    else
        return Favour.all
    end
  end

end
