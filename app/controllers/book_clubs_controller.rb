class BookClubsController < ApplicationController
  before_action :set_book_club, only: [:show, :update, :destroy]

  # GET /book_clubs
  def index
    @book_clubs = BookClub.all

    render json: BookClubSerializer.new(@book_clubs).serializable_hash[:data].map{ |hash| hash[:attributes] }
  end

  # GET /book_clubs/1
  def show
    hash = BookClubSerializer.new(@book_club).serializable_hash
    render json: hash[:data][:attributes]
  end

  # POST /book_clubs
  def create
    @book_club = current_user.book_clubs.build(book_club_params)
    @book_club.meeting_time = Time.now

    if @book_club.save
      render json: @book_club, status: :created, location: @book_club
    else
      render json: @book_club.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_clubs/1
  def update
    if @book_club.update(book_club_params)
      render json: @book_club
    else
      render json: @book_club.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_clubs/1
  def destroy
    @book_club.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_club
      @book_club = BookClub.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_club_params
      params.require(:book_club).permit(:name, :category, :description, :meeting_time, :current_book_id)
    end
end
