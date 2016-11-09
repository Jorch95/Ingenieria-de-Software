class AchievementsController < ApplicationController
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
end
