class AddBirthToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :birthday, :string
  end
end
