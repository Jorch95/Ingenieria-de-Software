class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :es_admin?, only: [:index, :destroy]

  def index
    order = params[:sort] || "rango"
    if order == "titulo"
      ordering = { titulo: :asc }
    elsif order == "rango"
      ordering = { rango_inferior: :asc }
    end
    @achievements=Achievement.where(enable: true).order(ordering)
  end

  def destroy
    a=Achievement.find(params[:id])
    a.enable=false
    a.save
    redirect_to achievements_path
  end

  private
  def es_admin?
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
