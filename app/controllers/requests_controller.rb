class RequestsController < ApplicationController
  def new
    @request=Request.new
    @favour=Favour.find(params[:favour_id])    
  end

  def create
    @favour = Favour.find(params[:favour_id])
    @request= current_user.requests.new(descripcion: params[:request][:descripcion], fecha: params[:request][:fecha], favour_id: @favour.id)
    if @request.save
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

end


