class UsersController < ApplicationController
	before_action :es_admin?
  def show
      @user = User.find(params[:id])
  end

	def save_card
		unless current_user.update(save_card_params)
			mensajes = ""
			current_user.errors.full_messages.each do |m|
				mensajes += "<li>" + m + "</li>"
			end
			flash[:alert] = "Existen errores: <br>" + mensajes
		end
		redirect_to new_purchases_path
	end

  def ranking
		@users = User.all
    @puntaje = @users.order(puntaje: :desc)
	end

	private

	def save_card_params
    	params.require(:user).permit(:tc_apellido, :tc_nombre, :tc_numero, :tc_pin, :tc_caducidad)
	end
	 def es_admin?
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
