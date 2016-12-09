class RequestsController < ApplicationController
  before_action :authenticate_user!
  def new
    @request=Request.new
    @favour=Favour.find(params[:favour_id])
  end

  def index
    id_a=[]
    current_user.requests.each do |r|
        unless r.favour.finalizado
          id_a << r.id
        end
    end
    @requests=Request.where(id: id_a)
  end

  def create
    @favour = Favour.find(params[:favour_id])
    @request= current_user.requests.new(descripcion: params[:request][:descripcion], fecha: params[:request][:fecha], favour_id: @favour.id)
    if @request.save
      @favour.user.notifications.create(texto: "Tienes una nueva solicitud de ayuda para el favor "+@favour.titulo, url: "/favours/"+@favour.id.to_s)
      redirect_to favour_url(@favour)
      flash[:notice]="La solicitud se ha enviado correctamente"
    else
      render :new
    end
  end

  def show
    @favour = Favour.find(params[:favour_id])
    # para que en la vista solo actualice el icono del campo correspondiente se le agrega al sentido el -c para el create_at, el -t para el total y asi siguiendo.
    order = params[:sort] || "created_at"
    @sentido = params[:sentido] || "asc-c"
    if order == "fecha"
      if (@sentido == "asc-f")
        ordering = { fecha: :asc }
      else
        ordering = { fecha: :desc }
      end
    elsif order == "created_at"
      if (@sentido == "desc-c")
        ordering = { created_at: :desc }
      else
        ordering = { created_at: :asc }
      end
    elsif order == "usuario"
      if (@sentido == "asc-u")
        ordering = { user_id: :asc }
      else
        ordering = { user_id: :desc }
      end
    end
    @requests = @favour.requests.order(ordering)
  end

  def update
    r=Request.find(params[:id])
    r.update(aceptacion: true)
    #debe eliminar el resto
    r.favour.requests.where.not(id: params[:id]).each do |req|
      req.user.notifications.create(texto: "Se ha rechazado tu solicitud para el favor "+r.favour.titulo)
      req.destroy
    end
    r.favour.update(aceptado: true)
    r.user.notifications.create(texto: "Se ha aceptado tu solicitud al favor "+r.favour.titulo, url: "/contact?request_id="+r.id.to_s)
    redirect_to contact_path(request_id: r.id)
  end

end
