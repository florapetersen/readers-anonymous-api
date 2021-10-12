class BookClubSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :category, :description, :current_book_id
  
end
