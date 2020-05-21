class CommentsController < ApplicationController

  def create     
    @profile = Profile.find(params[:comment][:profile_id])
    @comment = Comment.new(comment_model_params)
    @comment.profile=@profile
    @comment.user= current_user
    if @comment.save
      flash[:notice]  = "Comentário adicionado com sucesso"
    else
      flash[:notice]  = "Houve um problema ao criar esse comentário"
    end
    redirect_to profile_path(@profile)
  end

  private

  def comment_model_params
    params.require(:comment).permit(:profile,:user,:message)
  end
end
