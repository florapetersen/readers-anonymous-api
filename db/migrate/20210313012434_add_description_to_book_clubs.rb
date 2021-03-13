class AddDescriptionToBookClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :book_clubs, :description, :text
  end
end
