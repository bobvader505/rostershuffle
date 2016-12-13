class ChangeRoleReference < ActiveRecord::Migration[5.0]
  def change
  	change_column :transactions, :role,  :integer
  end
end
