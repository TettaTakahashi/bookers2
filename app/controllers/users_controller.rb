class UsersController < ApplicationController
  def show
  end
  
  def index
    @users=User.all
  end

  def edit
    @user=User.find(params[:id])
  end
end
