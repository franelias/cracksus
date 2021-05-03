class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :password
      t.string :mail
      t.string :status
      t.string :role

      t.timestamps
    end
    add_reference :users, :games

  end
end
