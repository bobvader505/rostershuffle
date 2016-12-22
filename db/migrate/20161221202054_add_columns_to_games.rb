class AddSlugToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :name, :string
    add_column :games, :logo, :string
    add_column :games, :active, :boolean
    add_reference :regions, :game, foreign_key: true
    add_column :games, :slug, :string
  end
end
