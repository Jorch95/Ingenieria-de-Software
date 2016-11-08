class FavoursController < ApplicationController
  def index
    	 @favours = Favour.all
  end
  def show
      @favour = Favour.find(params[:id])
  end
  def Editar
      @favour = Favour.find(params[:id])
      if session[:user_id] != @favour.user_id
        @edit = false
        flash[:notice] = "No podes editar este tweet"
        redirect_to(index)
      else
        @edit = true
      end
  end
end
