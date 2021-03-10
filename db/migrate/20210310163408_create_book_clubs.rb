class CreateBookClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :book_clubs do |t|
      t.string :name,              null: false, default: ""
      t.string :category,              null: false, default: ""
      t.datetime :meeting_time,              null: false, default: ""
      t.timestamps
    end
  end
end
