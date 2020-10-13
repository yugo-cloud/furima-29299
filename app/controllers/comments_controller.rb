class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', {comment: @comment, user: current_user, date: @comment.created_at.strftime("%Y年%m月%d日  %H時%M分")}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

#commentsコントローラーはコメントを保存する指示を出すためのコントローラー