class AchievementsController < ApplicationController
  def index
    @achievements=Achievement.where(enable: true).order(:rango_inferior)
  end
  def destroy
    a=Achievement.find(params[:id])
    a.enable=false
    a.save
    redirect_to achievements_path
  end
end
