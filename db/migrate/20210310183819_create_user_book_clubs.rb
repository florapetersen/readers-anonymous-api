class CreateUserBookClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_book_clubs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
