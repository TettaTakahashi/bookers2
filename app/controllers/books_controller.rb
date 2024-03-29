class BooksController < ApplicationController
  def new
  end
  
   def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
    else
      @user=current_user
      @books=Book.all
      render :index
    end
   end
   
   def update
     @user=current_user
     @book=Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice]="You have updated book successfully."
       redirect_to book_path(@book)
     else
       render :edit
     end
   end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def show
    @book=Book.find(params[:id])
    @user=@book.user
    @book_new=Book.new
  end

  def edit
    @book=Book.find(params[:id])
    @user=User.find(@book.user_id)
    unless @user.id == current_user.id
     redirect_to books_path
    end
  end
  
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
