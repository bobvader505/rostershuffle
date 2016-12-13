class ChangeRolesToRoleId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :transactions, :role, :role_id
  end
end
