class UsersController < ApplicationController
  
  def new
  @user=User.new
  end
  
  def update
     @user=current_user
     @user.update(user_params)
     flash[:notice]="You have updated user successfully."
    redirect_to user_path(current_user)
  end
 

  def show
    @user = User.find(params[:id]) 
    @books=@user.books
  end

  def edit
    @user=current_user
   
  end
  
  def index
  @user=current_user
  @users=User.all
 @book= Book.new
  end
  
  
  
  private


  
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
 
  
end