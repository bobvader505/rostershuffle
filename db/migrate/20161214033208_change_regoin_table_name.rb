class ChangeRegoinTableName < ActiveRecord::Migration[5.0]
  def change
  	rename_table :region, :regions
  	add_reference :teams, :regions, foreign_key: true
  end
end
