class BookClub < ApplicationRecord
    belongs_to :current_book, class_name: "Book"
    has_many :users

end
