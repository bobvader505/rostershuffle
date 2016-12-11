class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :tag
      t.references :team

      t.timestamps
    end
  end
end
