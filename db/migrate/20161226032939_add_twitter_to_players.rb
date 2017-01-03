class AddTwitterToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :twitter, :string
  end
end
