class CommentsController < ApplicationController
  def new
    @comment=Comment.new
  end
  def create
    @favour = Favour.find(params[:favour_id])
    @comment = current_user.comments.new(comentario: params[:comment][:comentario], respuesta: params[:comment][:respuesta], favour_id: @favour.id)
    if @comment.save
      redirect_to favour_url(@favour)
    else
      render :new
    end
  end

end
