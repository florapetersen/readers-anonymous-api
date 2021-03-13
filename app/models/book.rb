class Book < ApplicationRecord
    has_one_attached :poster
    has_many :book_club_books
    has_many :book_clubs, through: :book_club_books
end
