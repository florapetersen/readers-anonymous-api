class RemoveMeetingTimeFromBookClubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_clubs, :meeting_time, :datetime
  end
end
