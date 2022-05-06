class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :seed_name 
      t.integer :amount
      t.integer :weeks_to_mature 
      t.string :growing_season 
      t.boolean :has_been_planted, default: false
      t.date :when_planted

      t.timestamps
    end
  end
end
