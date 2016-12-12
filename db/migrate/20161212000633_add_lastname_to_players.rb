class AddLastnameToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :lastname, :string
    rename_column :players, :name, :firstname
    rename_column :players, :tag, :name
  end
end
