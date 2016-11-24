class ContactController < ApplicationController
  def contact
    @user=User.find(params[:id])
  end
end
