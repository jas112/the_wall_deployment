class MessagesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @messages = Message.includes(:comments)
    render layout: "three_column"
  end

  def create
    @user = User.find(session[:user_id])
    @message = @user.messages.new(message_params)
    if @message.save
      flash[:notice] = "New Message Posted"
      redirect_to '/messages'
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to '/messages'
    end
  end

  def show
    @message = Message.find(params[:id])
    # @comments = @message.comments.joins(:user)
    @comments = @message.comments
    # @comments = Comment.joins(:user).where(message_id: params[:id])
  end

  def new
  end

  private
    def message_params
      params.require(:message).permit(:message)
    end

end
