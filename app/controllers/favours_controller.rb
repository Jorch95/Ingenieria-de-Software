class FavoursController < ApplicationController
  def index
    	 @favours = Favour.all
  end
  def show
      @favour = Favour.find(params[:id])
  end
  def edit
      @favour = Favour.find(params[:id])
      if current_user != @favour.user
        flash[:notice] = "No podes editar este favor"
        redirect_to action: "index"
      end
  end
end
