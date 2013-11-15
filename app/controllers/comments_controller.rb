class CommentsController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all 
  
  def create
    if !params[:comment][:message].blank?
      @comment = Comment.create(comment_params)
      @comment.user = current_user
      @comment.save
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:criterium_id, :message, :user_id)
  end

end
