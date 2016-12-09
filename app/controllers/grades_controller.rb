class GradesController < ApplicationController
  def new
    @favour=Favour.find(params[:favour_id])
    @user=@favour.requests.first.user
    f=Favour.find(params[:favour_id])
    if f.requests.first.fecha<DateTime.now.to_date
      f.update(finalizado: true)
    end
    if f.finalizado
      @grade=Grade.new
    else
      flash[:alert]="Todavia no pasó la fecha de realizacion del favor. Se podrá calificar a partir de "+ f.requests.first.fecha.to_datetime.strftime("%d/%m/%Y")
      redirect_to favour_path(params[:favour_id])
    end
  end

  def create
    @favour=Favour.find(params[:favour_id])
    @user=@favour.requests.first.user
    f=Favour.find(params[:favour_id])
    @grade=f.requests.first.user.grades.new(descripcion: params[:grade][:descripcion], calificacion:params[:grade][:calificacion],favour_id: f.id)
    if @grade.save
      redirect_to root_path
      flash[:notice]="La calificacion se realizo correctamente"
    else
      render :new
    end
  end

  def calificaciones
    @user=User.find(params[:user_id])
    @back=params[:back_url]
  end
end
