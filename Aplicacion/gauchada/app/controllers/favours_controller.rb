class FavoursController < ApplicationController
  def index
    	 @favours = Favour.all
  end
  def show
      @favour = Favour.find(params[:id])
  end
end
