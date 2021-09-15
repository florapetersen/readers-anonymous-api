class UserBookClubsController < ApplicationController
  before_action :set_user_book_club, only: [:show, :update, :destroy]

  # GET /user_book_clubs
  def index
    @user_book_clubs = UserBookClub.all

    render json: UserBookClubSerializer.new(@user_book_clubs).serializable_hash[:data].map{ |hash| hash[:attributes] }
  end

  # GET /user_book_clubs/1
  def show
    render json: @user_book_club
  end

  # POST /user_book_clubs
  def create
    @user_book_club = current_user.user_book_clubs.build(user_book_club_params)
    #@book_club_id = book_club_id

    if @user_book_club.save
      render json: @user_book_club, status: :created, location: @user_book_club
    else
      render json: @user_book_club.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_book_clubs/1
  def update
    if @user_book_club.update(user_book_club_params)
      render json: @user_book_club
    else
      render json: @user_book_club.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_book_clubs/1
  def destroy
    @user_book_club.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book_club
      @user_book_club = UserBookClub.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_book_club_params
      params.require(:user_book_club).permit(:user_id, :book_club_id, :name)
    end
end
