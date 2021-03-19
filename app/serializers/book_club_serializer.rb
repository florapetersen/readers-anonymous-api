class BookClubSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :category, :description, :meeting_time, :current_book_id
  
end
