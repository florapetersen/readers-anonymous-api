class CreateBookClubBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_club_books do |t|
      t.date :started_on
      t.date :completed_on
      t.references :book, null: false, foreign_key: true
      t.references :book_club, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
