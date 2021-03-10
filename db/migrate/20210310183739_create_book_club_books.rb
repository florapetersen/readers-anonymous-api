class CreateBookClubBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_club_books do |t|
      t.date :started_on
      t.date :completed_on

      t.timestamps
    end
  end
end
