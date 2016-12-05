class CommentsController < ApplicationController
  def new
    @comment=Comment.new
  end
  def create
    @favour = Favour.find(params[:favour_id])
    @comment = current_user.comments.new(comentario: params[:comment][:comentario], respuesta: params[:comment][:respuesta], favour_id: @favour.id)
    if @comment.save
      @favour.user.notifications.create(texto: "Se realizo una pregunta por "+current_user.nombre+" en el favor "+@favour.titulo)
      redirect_to favour_url(@favour)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update(comment_params)
      @comment.user.notifications.create(texto: "Te respondieron la pregunta en el favor "+Favour.find(@comment.favour_id).titulo)
      redirect_to favour_url(@comment.favour_id)
    else
      render :edit
    end
  end

  def comment_params
    params.require(:comment).permit(:respuesta)
  end

end
