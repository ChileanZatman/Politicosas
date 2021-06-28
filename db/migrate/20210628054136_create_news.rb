class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.date :release
      t.string :email
      t.references :origin, polymorphic: true, null: false

      t.timestamps
    end
  end
end
