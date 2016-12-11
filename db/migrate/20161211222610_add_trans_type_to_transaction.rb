class AddTransTypeToTransaction < ActiveRecord::Migration[5.0]
  def change
  	remove_column :transactions, :transaction_type
    add_reference :transactions, :transtype, foreign_key: true
  end
end
