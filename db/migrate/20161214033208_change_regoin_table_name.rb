class ChangeRegoinTableName < ActiveRecord::Migration[5.0]
  def change
  	rename_table :region, :regions
  end
end
