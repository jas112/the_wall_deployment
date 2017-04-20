class UsersController < ApplicationController

  def index
    session[:user_id] ||=0
    render layout: "three_column"
  end

  def new
    render layout: "three_column"
  end

 def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to '/messages'
     # redirect_to 'users/show/'
   else
     flash[:errors] = @user.errors.full_messages
     redirect_to :back
   end
 end

 def login
   if User.exists?(login_params)
     @user = User.find_by(login_params)
     session[:user_id] = @user.id
     redirect_to "/messages"
   else
     flash[:errors] = @user.errors.full_messages
     redirect_to :back
   end
 end

 def logout
   reset_session
   redirect_to '/'
 end

 private
   def user_params
     params.require(:user).permit(:first_name, :last_name, :email)
   end

   def login_params
     params.require(:login).permit(:email)
   end

end
