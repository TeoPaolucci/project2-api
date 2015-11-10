class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :discs
      t.integer :time
      t.integer :moves

      t.timestamps null: false
    end
  end
end
