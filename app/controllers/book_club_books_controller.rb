class BookClubBooksController < ApplicationController
  before_action :set_book_club_book, only: [:show, :update, :destroy]

  # GET /book_club_books
  def index
    @book_club_books = BookClubBook.all

    render json: BookClubBookSerializer.new(@book_club_books).serializable_hash[:data].map{ |hash| hash[:attributes] }
  end

  # GET /book_club_books/1
  def show
    render json: @book_club_book
  end

  # POST /book_club_books
  def create
    @book_club = current_user.book_club_books.build(book_club_book_params)

    if @book_club_book.save
      render json: @book_club_book, status: :created, location: @book_club_book
    else
      render json: @book_club_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_club_books/1
  def update
    if @book_club_book.update(book_club_book_params)
      render json: @book_club_book
    else
      render json: @book_club_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_club_books/1
  def destroy
    @book_club_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_club_book
      @book_club_book = BookClubBook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_club_book_params
      params.require(:book_club_book).permit(:started_on, :completed_on)
    end
end
