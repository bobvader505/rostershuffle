class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
      t.datetime :date
      t.string :role
      t.references :transtype, foreign_key: true

      t.timestamps
    end
  end
end
