class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      binding.pry
      ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @comment.user.nickname
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

#commentsコントローラーはコメントを保存する指示を出すためのコントローラー