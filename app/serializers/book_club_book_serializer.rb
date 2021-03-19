class BookClubBookSerializer
  include JSONAPI::Serializer
  attributes :id, :book_id, :book_club_id
end
