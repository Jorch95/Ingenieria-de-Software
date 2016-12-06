class NotificationsController < ApplicationController
  def index
    @notifications=current_user.notifications.order("created_at desc")
    unless @notifications.any?
      redirect_to root_path
    end
    @notifications.each do |n|
      n.update(checked: true)
    end
  end

  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_path
  end

  def redirekt
    Notification.find(params[:id]).update(checked: true)
    redirect_to Notification.find(params[:id]).url
  end

  def destroy_all
    current_user.notifications.destroy_all
    flash[:notice]="Se eliminaron todas las notificaciones correctamente"
    redirect_to root_path
  end
end
