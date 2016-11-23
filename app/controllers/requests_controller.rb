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
end
