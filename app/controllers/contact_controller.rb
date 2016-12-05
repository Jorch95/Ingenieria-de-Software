class ContactController < ApplicationController
  before_action :authenticate_user!
  def contact
    r=Request.find(params[:request_id])
    if current_user.id==r.favour.user.id
      @user=r.user
    else
      if current_user.id==r.user.id
        @user=r.favour.user
      else
        redirect_to root_path
      end
    end
  end
end
