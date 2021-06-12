class ChangeDatetimeToDateInGames < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :release_date, :date
    change_column :games, :crack_date, :date
  end
end
