class AddSourceToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :source, :string
  end
end
