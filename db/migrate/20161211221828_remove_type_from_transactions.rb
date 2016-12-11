class RemoveTypeFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :type, :string
  end
end
