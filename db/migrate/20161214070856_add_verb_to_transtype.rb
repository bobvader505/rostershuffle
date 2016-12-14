class AddVerbToTranstype < ActiveRecord::Migration[5.0]
  def change
    add_column :transtypes, :verb, :string
  end
end
