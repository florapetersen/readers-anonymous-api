class BookClub < ApplicationRecord
    has_one_attached :poster
    belongs_to :current_book, :class_name => "Book", optional: true 
    has_many :users
    has_many :book_club_books
    has_many :books, through: :book_club_books
    validates :name, presence: true, uniqueness: true
end
