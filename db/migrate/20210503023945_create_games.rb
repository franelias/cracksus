class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :status
      t.string :anti_tamper
      t.text :image_url
      t.text :store_url
      t.string :cracked_by
      t.datetime :release_date
      t.datetime :crack_date

      t.timestamps
    end
  end
end
