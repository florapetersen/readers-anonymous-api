class AddNameToUserBookClub < ActiveRecord::Migration[5.2]
  def change
    add_column :user_book_clubs, :name, :string
    add_index :user_book_clubs, :name
  end
end
