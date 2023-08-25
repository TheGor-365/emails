class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @user = User.first
    @book = @user.books.build
  end

  def edit
  end

  def create
    @user = User.first
    @book = @user.books.build(book_params)

    respond_to do |format|
      if @book.save
        BookMailer.with(user: @user, book_title: @book.title).create_book_email.deliver_now
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
