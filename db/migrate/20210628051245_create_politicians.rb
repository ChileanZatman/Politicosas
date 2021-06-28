class CreatePoliticians < ActiveRecord::Migration[6.1]
  def change
    create_table :politicians do |t|
      t.string :name
      t.date :birthdate
      t.string :position
      t.string :political_compass
      t.string :previous_position
      t.string :education
      t.boolean :president
      t.references :political_party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
