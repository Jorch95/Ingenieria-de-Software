class FavoursController < ApplicationController
  def index
      @favours = inicializar_favor.where(aceptado: false)
  end # No aceptado
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
    aux_favor = Favour.all
    if params[:filtrado_descripcion].present?
       aux_favor = aux_favor.descripcion(params[:filtrado_descripcion])
    end
    if params[:filtrado_titulo].present?
      aux_favor = aux_favor.titulo(params[:filtrado_titulo])
    end
    if params[:filtrado_ciudad].present?
      aux_favor = aux_favor.ciudad(params[:filtrado_ciudad])
    end
    if params[:filtrado_provincia].present?
      aux_favor = aux_favor.provincia(params[:filtrado_provincia])
    end

    if params[:ordenado_por].present?
      campo = params[:ordenado_por].split.first
      forma = params[:ordenado_por].split[1] # agarra el elemento numero 2
      if forma == "A-Z" || forma == "creciente"
        forma = "asc"
      elsif forma == "Z-A" || forma == "decreciente"
        forma = "desc"
      else
        flash[:alert]="Hubo un error critico, por favor reinicia la pagina."
      end
      if campo == "Fecha"
        campo = "created_at"
      else
        campo = campo.downcase
      end
      aux_favor = aux_favor.ordenadoPor(campo, forma)
    else
      aux_favor = aux_favor.ordenadoPorDefault()
    end
    return aux_favor
end

  def destroy
    f=Favour.find(params[:id])
    if f.aceptado==false
      f.destroy
      flash[:notice]="Se elimino satisfactoriamente"
    end
    redirect_to favours_path
  end

end
