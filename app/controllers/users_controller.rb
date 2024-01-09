class UsersController < ApplicationController
  def show
    @user = current_user
    # @books=Book.find(params[:id])
    @books=@user.books
    @book=Book.new
  end
  
  def index
    @users=User.all
    @user = current_user
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
