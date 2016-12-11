class AddNameToTranstype < ActiveRecord::Migration[5.0]
  def change
    add_column :transtypes, :name, :string
  end
end
