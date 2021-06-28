class CreatePoliticalParties < ActiveRecord::Migration[6.1]
  def change
    create_table :political_parties do |t|
      t.string :name
      t.date :founding
      t.string :political_compass
      t.string :coalition
      t.string :founding_ideology
      t.string :principles

      t.timestamps
    end
  end
end
