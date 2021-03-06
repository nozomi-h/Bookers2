class BooksController < ApplicationController
  before_action :authenticate_user! ,only: [:index, :new, :show, :edit, :update, :create, :destroy]
  def index
    @book = Book.new
    @books = Book.all
  end
  def new
    @book = Book.find(params[:id])
  end
  def top
  end
  def about
  end
  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = current_user
  end
  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to books_path
    end
  end
  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]= "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
