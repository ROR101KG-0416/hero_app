class CommentsController < ApplicationController
  def create
    params[:comment].merge!(character_id: params[:character_id], 
                            user_id: current_user.id)

    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to character_path(params[:character_id]), notice: "Comment was added"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :character_id, :user_id)
  end
end