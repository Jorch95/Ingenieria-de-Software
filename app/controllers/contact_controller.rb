class ContactController < ApplicationController
  before_action :authenticate_user!
  def contact
    if current_user.id==Request.find(params[:request_id]).favour.user.id
    @user=Request.find(params[:request_id]).user
  else
    redirect_to root_path
  end
  end
end
