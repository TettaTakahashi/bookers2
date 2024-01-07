class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def index
    @users=User.all
    @user = current_user
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end
end
