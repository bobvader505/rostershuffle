class RemoveTeamFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :players, :team, foreign_key: true
  end
end
