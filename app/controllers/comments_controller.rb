class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.story, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.story, alert: 'Unable to create comment.'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:story_id, :message)
  end


end
