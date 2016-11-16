class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :es_admin?, only: [:index, :destroy]

  def new
    @achievement=Achievement.new
  end

  def show
    @achievement=Achievement.find params[:id]    
  end

  def create
    @achievement=Achievement.new achievement_params
    if @achievement.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @achievement = Achievement.find params[:id]
  end

  def update
    @achievement = Achievement.find params[:id]
    if @achievement.update(achievement_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def index
    order = params[:sort] || "rango"
    if order == "titulo"
      ordering = { titulo: :asc }
    elsif order == "rango"
      ordering = { rango_inferior: :asc }
    end
    @achievements=Achievement.order(ordering)
  end

  def destroy
    a=Achievement.find(params[:id])
    if a.users.any?
      a.enable=false
      if a.save
        flash[:notice]="El logro tiene usuarios asociados. Se realizo baja lógica"
      end
    else
      a.destroy
      flash[:notice]="Se elimino satisfactoriamente"
    end
    redirect_to achievements_path
  end

  private
  def es_admin?
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def achievement_params
    params.require(:achievement).permit(:titulo,:descripcion, :rango_inferior, :rango_superior)
  end
end
