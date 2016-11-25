class NotificationsController < ApplicationController
  def index
    @notifications=current_user.notifications
    if @notifications.any?
    else
      flash[:notice]="No tienes niguna notificacion"
      redirect_to :back
    end
  end

  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_path
  end

end
