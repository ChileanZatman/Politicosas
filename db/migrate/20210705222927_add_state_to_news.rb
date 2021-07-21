class AddStateToNews < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :state, :boolean, default: false
  end
end
