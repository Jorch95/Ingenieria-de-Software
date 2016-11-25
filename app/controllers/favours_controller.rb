class FavoursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @favours = inicializar_favor
    if user_signed_in?
      @requests= Request.where(user_id: current_user.id)
    end
  end # No aceptado
  def show
    @favour = Favour.find(params[:id])
    if user_signed_in?
      @requests= Request.where(user_id: current_user.id)
    end
  end

  def edit
    @favour = Favour.find(params[:id])
  end

  def update
    @favour = Favour.find params[:id]
    if @favour.update(favour_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def new
    @favour = Favour.new
    @puntaje = current_user.puntaje
  end
  def create
    @favour=current_user.favours.new favour_params
    user = current_user
    puntajeN = user.puntaje-1
    user.update(puntaje: puntajeN)
    if @favour.save
      redirect_to action: "index"
    else
      render :new
    end
  end


  def inicializar_favor
    aux_favor = Favour.all

      if params[:filtrado_user_id].present? && params[:estatus].present?
        if user_signed_in?
          if current_user.id == Integer(params[:filtrado_user_id]) # Si no es el mismo usuario que pide la solicitud que no filtre.
              if params[:estatus] == "todos"
                aux_favor = aux_favor.user_id(params[:filtrado_user_id])
              elsif params[:estatus] == "aceptado"
                aux_favor = aux_favor.user_id(params[:filtrado_user_id]).where(aceptado: true)
              elsif params[:estatus] == "finalizado"
                aux_favor = aux_favor.user_id(params[:filtrado_user_id]).where(finalizado: true)
              end
          else
            redirect_to root_path
          end
        else
          redirect_to root_path
        end
      else
        aux_favor = aux_favor.where(aceptado: false).where(finalizado: false)
      end

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
  def favour_params
    params.require(:favour).permit(:titulo,:descripcion, :ciudad, :image_url, :provincia)
  end
end
