class CommentsController < ApplicationController
  def create
    if !params[:comment][:message].blank?
      @comment = Comment.create(comment_params)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:criterium_id, :message)
  end


end
