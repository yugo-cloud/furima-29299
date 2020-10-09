class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
  
    if @comment.save
      redirect_to "/items/#{@comment.item.id}"
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

#commentsコントローラーはコメントを保存する指示を出すためのコントローラー