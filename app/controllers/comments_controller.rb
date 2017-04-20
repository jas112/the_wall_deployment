class CommentsController < ApplicationController
  def new
  end

  def create
    idx = params[:id]
    # @message = Message.find(idx)
    @comment = Comment.new(comment_params)
    # @comment.message_id = params[:id]
    # @comment = @message.comments.new(comment_params)
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :message_id)
    end

end
