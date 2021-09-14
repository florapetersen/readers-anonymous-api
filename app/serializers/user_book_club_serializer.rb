class UserBookClubSerializer
  include JSONAPI::Serializer
  attributes :id, :book_club_id, :user_id, :name
end
