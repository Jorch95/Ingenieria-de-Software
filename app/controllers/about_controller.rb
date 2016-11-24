class AboutController < ApplicationController
	def contact
		if params[:commit].present? && params[:commit] == "Enviar"
			if params[:email].empty? || params[:nombre].empty? || params[:mensaje].empty?
				flash[:alert]="Los campos no deben estar vacios."
			else
				SendMailer.contact(params[:email],params[:nombre],params[:mensaje]).deliver
				flash[:notice]="Se envio correctamente, te contestaremos a la brevedad."
			end
		end
	end
end
